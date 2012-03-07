document.on('dom:loaded', function() {
	$$('form').each(function(el) {
		el.on('submit', function(){
			this.writeAttribute('changed', '');
		});
	});
});
window.onbeforeunload = function() {
	var forms = $$('form[changed="true"]')
	if (forms.length > 0) {
		return Dialog.Messages.changedform;
	}
}

function form_change_alert(formname)
{
	var form = $$('form.' + formname).first();
	if (form) {
		form.getElements().each(function(el, i){
			el.on('change', function(e){
				form.writeAttribute('changed', 'true');
			});
		});
		Event.observe(document, 'grid:change', function(){
			form.writeAttribute('changed', 'true');
		});
	}
} 