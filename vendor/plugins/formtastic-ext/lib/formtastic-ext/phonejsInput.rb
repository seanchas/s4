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

      options.delete(:countries)
      options[:id] = generate_html_id(method, "")
      options[:input_html] ||= {}
      options[:input_html][:autocomplete] = :off
      options[:input_html][:class] = 'phonejs'
      template.content_for :js do
        template.javascript_tag "document.on('dom:loaded', function() { $('#{options[:id]}').observe('click', respondToClick);


function functionSave(event){
    var element = Event.element(event);
    var id = element.getAttribute('id');
    id = id.split('save_').join('');

    var withoutDisplay = id.split('_display').join('');

    $(id).value = $('country_'+id).getValue() + ' (' + $('towncode_'+id).getValue() + ') ' + $('phone_'+id).getValue();
    $(withoutDisplay+'_country_code').value = $('country_'+id).getValue();
    $(withoutDisplay+'_number').value = $('phone_'+id).getValue();
    $(withoutDisplay+'_areacode').value = $('towncode_'+id).getValue();
    $(withoutDisplay+'_internal_number').value = $('additional_'+id).getValue();
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function respondToClick(event) {

    var elementClicked = Event.element(event);
    var id = elementClicked.getAttribute('id');
    var withoutDisplay = id.split('_display').join('');

    var inputs = document.createElement('div');

    var label = document.createElement('label');
    label.htmlFor = 'country_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.country_code"}';
    var index = document.createElement('select');
    var obj = #{@countriesShow};
    for(var key in obj){
        if(isNumber(obj[key].id)){
            var child = document.createElement('option');
            child.innerHTML = obj[key].name;
            child.value = obj[key].id;
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
    index.value=$(withoutDisplay+'_areacode').getValue();
    index.type='text';
    index.maxlength= 5;
    index.width=10;

    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'phone_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.phone_number"}';
    var index = document.createElement('input');
    index.id = 'phone_'+id;
    index.value = $(withoutDisplay+'_number').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'additional_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.phone_add"}';
    var index = document.createElement('input');
    index.id ='additional_'+id;
    index.value = $(withoutDisplay+'_internal_number').getValue();
    index.type ='text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var saveButton = document.createElement('button');
    saveButton.id = 'save_'+id;
    saveButton.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.save"}';
    inputs.appendChild(saveButton);


    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: '#{ ::Formtastic::I18n::t "labels.popup.title_phones"}' });
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