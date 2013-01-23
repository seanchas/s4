module Formtastic
  class SemanticFormBuilder
    def phonejs_input(method, options)
      template.javascript_include_once "prototip/prototip"
      template.stylesheet_include_once "calendarview"
      @countriesShow = '['
      if options[:countries].nil?
        options[:countries] = {}
      end
      options[:countries].each do | country |
        if !country.attributes["tel_code"].nil? && country.attributes["tel_code"] != ''
          @countriesShow += "{'id' : \"#{country.attributes["tel_code"]}\", 'name' :\"#{country.attributes["name"]}\"},"
        end
      end
      @countriesShow += ']'
      title = options.delete(:title)
      options.delete(:countries)
      options[:id] = generate_html_id(method, "")
      options[:input_html] ||= {}
      options[:input_html][:autocomplete] = :off
      options[:input_html][:class] = 'phonejs'
      template.content_for :js do
        template.javascript_tag "document.on('dom:loaded', function() { $('#{options[:id]}').observe('click', respondToClick);

function checkEmpty(array, id) {
    var text = '';
    var errorCounter = 0;
    array.each(function(item)
    {
        if($(item).getValue() == null || $(item).getValue() == ''){
            text = text + '#{ ::Formtastic::I18n::t "labels.popup.error"}' + $$('label[for='+item+']').first().innerHTML + '<br>';
            errorCounter++;
        }
    });
    $('errors_'+id).innerHTML = text+'<br>';
    if(errorCounter != 0){
        return false;
    }
    return true;
}

function functionSave(event){
    var element = Event.element(event);
    var id = element.getAttribute('id');
    id = id.split('save_').join('');

    var withoutDisplay = id.split('_display').join('');
    var ids = ['country_'+id, 'towncode_'+id, 'phone_'+id];
    if(!checkEmpty(ids, id)){return false;};
    $(id).value = $('country_'+id).options[$('country_'+id).selectedIndex].id + ' (' + $('towncode_'+id).getValue() + ') ' + $('phone_'+id).getValue();
    $(withoutDisplay+'_country_code').value = $('country_'+id).getValue();
    $(withoutDisplay+'_number').value = $('phone_'+id).getValue();
    $(withoutDisplay+'_areacode').value = $('towncode_'+id).getValue();
    $(withoutDisplay+'_internal_number').value = $('additional_'+id).getValue();
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function valueReset(value) {
  if(value.length == 0)
           return '';

      first = value.charAt(0);
      value = value.replace(/[^0-9]/g,'');

      if(first == '-')
          value = first + value;
      return value;
}

function respondToClick(event) {

    var elementClicked = Event.element(event);
    var id = elementClicked.getAttribute('id');
    var withoutDisplay = id.split('_display').join('');

    var inputs = document.createElement('div');

    var errors = document.createElement('div');
    errors.id = 'errors_'+id;
    inputs.appendChild(errors);

    var label = document.createElement('label');
    label.htmlFor = 'country_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.country_code"}';
    var index = document.createElement('select');
    var obj = #{@countriesShow};
    for(var key in obj){
        if(isNumber(obj[key].id)){
            var child = document.createElement('option');
            child.innerHTML = obj[key].name;
            child.value = obj[key].name;
            child.id = obj[key].id;
            index.appendChild(child);
        }
    }
    index.id = 'country_'+id;
    index.value = $(withoutDisplay+'_country_code').getValue();
    index.width = 10;
    index.style.width = '240px';


    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'towncode_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.town_code"}';
    var index = document.createElement('input');
    index.id='towncode_'+id;
    var value = $(withoutDisplay+'_areacode').getValue();
    if(value == 'null'){value = '';}
    index.value = value;
    index.type='text';
    index.maxlength= 5;
    index.width=10;
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));
    index.observe('keyup', function(){
      var value = this.value, first;
      this.value = valueReset(value);
      return true;
    });

    var label = document.createElement('label');
    label.htmlFor = 'phone_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.phone_number"}';
    var index = document.createElement('input');
    index.id = 'phone_'+id;
    var value = $(withoutDisplay+'_number').getValue();
    if(value == 'null'){value = '';}
    index.value = value;
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));
    index.observe('keyup', function(){
      var value = this.value, first;
      this.value = valueReset(value);
      return true;
    });

    var label = document.createElement('label');
    label.htmlFor = 'additional_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.phone_add"}';
    var index = document.createElement('input');
    index.id ='additional_'+id;
    var value = $(withoutDisplay+'_internal_number').getValue();
    if(value == 'null'){value = '';}
    index.value = value;
    index.type ='text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    index.observe('keyup', function(){
      var value = this.value, first;
      this.value = valueReset(value);
      return true;
    });

    var saveButton = document.createElement('button');
    saveButton.id = 'save_'+id;
    saveButton.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.save"}';
    inputs.appendChild(saveButton);


    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: '#{ ::Formtastic::I18n::t title}' });
    saveButton.observe('click', functionSave);
    elementClicked.prototip.show();
}


 });"
      end
      options[:as].delete if options[:as]
      input(method, options).gsub(/^<li[^>]+>(.*)?<\/li>$/, '\1')
    end
  end
end