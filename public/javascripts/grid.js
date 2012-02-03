/*
 * @author zingorn <zingorn@gmail.com>
 */
Date.prototype.format = function(f)
{
	var gsMonthNames = new Array(
			'Январь',
			'Февраль',
			'Март',
			'Апрель',
			'Май',
			'Июнь',
			'Июль',
			'Август',
			'Сентябрь',
			'Октябрь',
			'Ноябрь',
			'Декабрь'
			);
	var gsDayNames = new Array(
			'Воскресенье',
			'Понедельник',
			'Вторник',
			'Среда',
			'Четверг',
			'Пятница',
			'Суббота'
			);
	
    if (!this.valueOf())
        return ' ';

    var d = this;

    return f.replace(/(yyyy|mmmm|mmm|mm|dddd|ddd|dd|hh|nn|ss|a\/p)/gi,
        function($1)
        {
            switch ($1.toLowerCase())
            {
            case 'yyyy': return d.getFullYear();
            case 'mmmm': return gsMonthNames[d.getMonth()];
            case 'mmm':  return gsMonthNames[d.getMonth()].substr(0, 3);
            case 'mm':   return (d.getMonth() + 1).zf(2);
            case 'dddd': return gsDayNames[d.getDay()];
            case 'ddd':  return gsDayNames[d.getDay()].substr(0, 3);
            case 'dd':   return d.getDate().zf(2);
            case 'hh':   return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case 'nn':   return d.getMinutes().zf(2);
            case 'ss':   return d.getSeconds().zf(2);
            case 'a/p':  return d.getHours() < 12 ? 'a' : 'p';
            }
        }
    );
}

var formtasticGrid = Class.create();
formtasticGrid.prototype = {
	formsData: {},
	checkboxViewSeparator: ',<br />',
	initialize: function(name, options)
	{
		this.options = options || {};
		this.name = name;
		
		// add form
		var addfrm = this.options.addform;
		this.addFormDialog = $(addfrm + '_div');

		this.emptyTableTr = $(this.name).getElementsBySelector('thead tr[empty_table=true]').first();
		this.templateTableTr = $(this.name).getElementsBySelector('thead tr[template=true]').first().innerHTML;
		var addBtn = $(this.name).next();

		if (addBtn != undefined) {
			var addBtnAction = addBtn.readAttribute('action');
			addBtn.on('click', (addBtnAction != null && typeof window[addBtnAction] == "function" ? window[addBtnAction] : this.addRow.bind(this)));
		}
		
		this.rowset = options.rowset;
		this.currentRowId = null;

		this.initRowset();
		this._checkEmptyTable();
	},
	initRowset: function()
	{
		var actions = $(this.name).getElementsBySelector('tbody td.actions');
		var self = this;
		actions.each(function(td){
			$(td).select('a').each(function(link){
				var id = $(link).readAttribute('rowid');
				var type = $(link).readAttribute('type');

				if (type == 'edit') {
					$(link).on('click', self.editRow.bind(self));
				}
				if (type == 'delete') {
					$(link).on('click', self.deleteRow.bind(self));
				}
			});
		});
	},
	deleteRow: function(e, target)
	{
		if (this.addFormDialog == null) return;
		Event.stop(e);
		Dialog.Box.Confirm(this.options.delete_row_title, this.options.delete_row_message, {
			'ok': function(){
				var id = $(target).readAttribute('rowid');
				var self = this;
				$(this.name).getElementsBySelector('tbody tr[rowid=' + id + ']').first().remove();

				// update numbering
				var tplNameValue = $(this.name).select('tbody').first().readAttribute('tpl');
				var tplName = new RegExp(('(' + tplNameValue + ')').replace(/\[/g, '\\[').replace(/\]/g, '\\]', true).replace('%i%', '\\d+'), 'i');
				
				var tplIdValue = tplNameValue.replace(/\]\[/g, '_').replace('[', '_').replace(']', '_');
				var tplId = new RegExp(('(' + tplIdValue + ')').replace('%i%', '\\d+'), 'i');

				// update name of hidden inputs
				$(this.name).getElementsBySelector('tbody tr').each(function(tr, i){
					var nameReplaceTo = tplNameValue.replace('%i%', i);
					var idReplaceTo = tplIdValue.replace('%i%', i);
					$(tr).select('[tpl=1]').each(function(item){
						var name = $(item).readAttribute('name');
						if (name) {
							$(item).writeAttribute('name', name.replace(tplName, nameReplaceTo));
						}

						var name = $(item).readAttribute('id');
						if (id) {
							$(item).writeAttribute('id', name.replace(tplId, idReplaceTo));
						}
					});
				});
				
				// remove from object rowset
				this.rowset.data = this.rowset.data.slice(0, id).concat(this.rowset.data.slice(id, this.rowset.data.length - 1));

				this._refreshRows();
				this._checkEmptyTable();
			}.bind(this)
		});
	},
	_refreshRows: function(){
		var self = this;
		// refresh rows color
		$(this.name).getElementsBySelector('tbody tr').each(function(tr, i){
			tr.removeClassName('odd')
			  .removeClassName('even')	
			  .addClassName(self._getRowClass(i))
			  .writeAttribute('rowid', i);
			tr.select('td.actions a[rowid]').each(function(a){ a.writeAttribute('rowid', i); });
		});
	},
	_getRowClass: function(num){
		return (num % 2 ? 'even' : 'odd');
	},
	_checkEmptyTable: function()
	{
		if ($(this.name).getElementsBySelector('tbody tr').length == 0) {
			this.emptyTableTr.show();
		} else {
			this.emptyTableTr.hide();
		}
	},
	_clearAddForm: function()
	{
		var form = this.addFormDialog.select('form').first();
		form.getInputs('text').each(function(v){v.setValue('');});
		form.getInputs('checkbox').each(function(v){v.checked = ''; });
		form.getInputs('radio').each(function(v){v.checked = '';});
		form.select('select').each(function(el){
			el.setValue('');
		});
	},
	_lockButtons: function()
	{
		var submit = this.addFormDialog.getElementsBySelector('form .buttons input, form .buttons button').each(function(v){
			v.disabled = true;
		});
	},
	_unlockButtons: function()
	{
		var submit = this.addFormDialog.getElementsBySelector('form .buttons input, form .buttons button').each(function(v){
			v.disabled = false;
		});
	},
	_rebindButtons: function()
	{
		var submit = this.addFormDialog.getElementsBySelector('form input[type=submit]').first();
		Event.stopObserving(submit, 'click');
		submit.on('click', this.save.bind(this));
		
		var cancel = this.addFormDialog.getElementsBySelector('form button.grid_cancel').first();
		if (cancel) {
			Event.stopObserving(cancel, 'click');
			cancel.on('click', function(event) { Event.stop(event); this._lockButtons(); this.addFormDialog.hide(); }.bind(this));
		}
	},
	editRow: function(e, target)
	{
		if (this.addFormDialog == null) return;
		Event.stop(e);
		new Dialog.Box(this.addFormDialog, {title: this.options.addformtitle});
		this.addFormDialog.writeAttribute('action', 'edit');

		this._rebindButtons();

		var id = $(target).readAttribute('rowid');
		this._clearAddForm();
		var data = this.rowset.data[id];
		var form = this.addFormDialog.select('form').first();

		var self = this;
		$H(this.options.meta).each(function(item){
			var name = self._getNameMetaItem(item);
			self._setViewValue(data[item.key], name, item);
		});
		this.currentRowId = $(target).readAttribute('rowid');

		var errDiv = $(this.addFormDialog).select('div.errorDiv').first();
		if (typeof(errDiv) != 'undefined') {
			errDiv.update('');
		}
		this._unlockButtons();
		this.addFormDialog.show();
	},
	addRow: function()
	{
		if (this.addFormDialog == null) return;
		// add form
		new Dialog.Box(this.addFormDialog, {title: this.options.addformtitle});
		this.addFormDialog.writeAttribute('action', 'add');

		this._rebindButtons();

		this._clearAddForm();
		var errDiv = $(this.addFormDialog).select('div.errorDiv').first();
		if (typeof(errDiv) != 'undefined') {
			errDiv.update('');
		}

		this._unlockButtons();
		this.addFormDialog.show();
	},
	_getValueByType: function(item){
		var result = null;
		var el = this.addFormDialog.select('[id="' + item.name + '"]').first();
		switch(item.type) {
		  case 'boolean':
			  result = el.checked ? 1 : 0;
			  break;
		}
		return result;
	},
	_getViewValue: function(name, value){
		var result = '';
		// format of exclusion: _{#name}ViewValue(item){}
		if (eval('typeof this._' + name + 'GetViewValue == "function"')) {
			var f = eval('this._' + name + 'GetViewValue');
			result = f(name, item);
		} else if (!Object.isString(this.options.meta[name])) {
			var el = this.addFormDialog.select('[id="' + name + '"]').first();
			switch(this.options.meta[name].type) {
			  case 'boolean':
				result = el.checked ? 'Да' : 'Нет';
				result += new Element('div').update(new Element('input', {
					type: 'hidden', 
					value: result, 
					name: [this.name, '[', (this.currentRowId != null ? this.currentRowId : this.rowset.data.length), '][', name, ']'].join('') // not "-1"
				})).innerHTML;
			  case 'checkboxes':
				value = Object.isString(value) ? [value] : value;
				result = [];
				$A(value).each(function(itm){
					var el = this.addFormDialog.select('label[for="' + [this.options.meta[name].name,itm].join('_') + '"]').first();
					var text = Prototype.Browser.Gecko ? el.textContent : el.innerText;
					result.push(text +
							new Element('div').update(new Element('input', {
								type: 'hidden', 
								value: itm, 
								name: [this.name, '[', (this.currentRowId != null ? this.currentRowId : this.rowset.data.length), '][', name, '][]'].join('') // not "-1"
							})).innerHTML);
				}.bind(this));
				result = result.join(this.checkboxViewSeparator);
			}
		} else {
			var el = this.addFormDialog.select('[id="' + this.options.addform + '_' + name +'"]').first();
			result = (el.nodeName.toLowerCase() == 'select') ? $(el).select("option[value='" +value + "']").first().text: value;

			result += new Element('div').update(new Element('input', {
				type: 'hidden', 
				value: value, 
				name: [this.name, '[', (this.currentRowId != null ? this.currentRowId : this.rowset.data.length), '][', name, ']'].join('') // not "-1"
			})).innerHTML;
		}

		return result;
	},
	_setViewValue: function(value, name, item){
		if (eval('typeof this._' + name + 'SetViewValue == "function"')) {
			var f = eval('this._' + name + 'SetViewValue');
			result = f(name, item);
		} else if (!Object.isString(item.value)) {
			switch(item.value.type) {
			  case 'boolean':
				var el = this.addFormDialog.select('[id="' + name + '"]').first();
				el.checked = value;
				break;
			  case 'checkboxes':
				value = Object.isString(value) ? [value] : value;
				$A(value).each(function(item){
					this.addFormDialog.select('[id="' + [name, item].join('_')  + '"]').first().checked = true;
				}.bind(this));
				break;
			}
		} else {
			this.addFormDialog.select('[id="' + item.value + '"]').first().setValue(value);
		}
	},
	_getNameMetaItem: function(item)
	{
		return Object.isString(item.value) ? item.value : item.value.name;
	},
	_editSave: function(row, rowView)
	{
		// update rowset data
		this.rowset.data[this.currentRowId] = row;

		// update grid UI
		var newTr = new Element('tr', {"class": this._getRowClass(this.currentRowId)})
			.insert(new Template(this.templateTableTr).evaluate(rowView));
		newTr.writeAttribute('rowId', this.currentRowId);
		var oldTr = $(this.name).select('tbody tr[rowid="' + this.currentRowId +'"]').first();
		oldTr.insert({after: newTr});

		var oldActionsEl = oldTr.select('td.actions').first();
		var newActionsEl = newTr.select('td.actions').first()
		newActionsEl.insert({before: oldActionsEl});
		newActionsEl.remove();

		oldTr.remove();

		// update global UI
		this._checkEmptyTable();
		this.currentRowId = null;
		this.addFormDialog.hide();
	},
	_addSave: function(row, rowView)
	{
		var rowsnum = this.rowset.data.length;
		this.rowset.data.push(row);

		// add view row
		var tr = new Element('tr', {"class": this._getRowClass(rowsnum)})
	    	   .insert(new Template(this.templateTableTr).evaluate(rowView));
		$(this.name).getElementsBySelector('tbody').first().appendChild(tr);

		tr.writeAttribute('rowid', rowsnum);
		// bind actions
		$(tr).select('td.actions a[type="delete"]').first()
			.writeAttribute('rowid', rowsnum)
			.on('click', this.deleteRow.bind(this));
		$(tr).select('td.actions a[type="edit"]').first()
			.writeAttribute('rowid', rowsnum)
			.on('click', this.editRow.bind(this));
		
		// update UI
		this._checkEmptyTable();
		this.currentRowId = null;
		this.addFormDialog.hide();
	},
	save: function(event, target)
	{
		Event.stop(event);
		this._lockButtons();
		var self = this;

		var form = $(this.addFormDialog).select('form').first();
		var formData = form.serialize();
		formData += ['&_formName=', encodeURIComponent(form.readAttribute('name').split("_").invoke("capitalize").join('::')),
		             '&_formAlias=', encodeURIComponent(form.readAttribute('name'))].join('');

		new Ajax.Request('/formvalidate', {
			parameters: formData,
			onSuccess: function(r){
				var html = r.responseText;
				if (html == 'true') { // is valid
					var action = self.addFormDialog.readAttribute('action');
					var rowView = {}, row = {};

					$H(self.addFormDialog.select('form').first().serialize(true)).each(function(item){
						var da = /([^[]*)\](\[\])?$/.exec(item.key);
						if (da != null) {
							var name = da[1];
							if (typeof this.options.meta[name] != "undefined") {
								row[name] = item.value;
								rowView[name] = this._getViewValue(name,  item.value);
							}
						}
					}.bind(self));
					if (action == 'edit') {
						self._editSave(row, rowView);
					} else {
						self._addSave(row, rowView);
					}
				} else { // not valid
					// add error div
					var errDiv = $(form).previous();
					if (typeof(errDiv) == 'undefined' || !errDiv.hasClassName('errorDiv')) {
						errDiv = new Element('div').addClassName('errorDiv');
						form.insert({before: errDiv});
					}
					errDiv.update(html);
					self._unlockButtons();
				}
			}
		});

	}
}