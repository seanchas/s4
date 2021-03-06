module Formtastic
  class SemanticFormBuilder
    def post_input(method, options)
      template.javascript_include_once "prototip/prototip"
      template.stylesheet_include_once "calendarview"
      @countriesShow = '['
      if options[:countries].nil?
        options[:countries] = {}
      end
      options[:countries].each do | country |
        if !country.attributes["tel_code"].nil? && country.attributes["tel_code"] != ''
          # @countriesShow += "<option value=#{country.attributes["tel_code"]}>#{country.attributes["name"]}</option>"
          @countriesShow += "{'id' : \"#{country.attributes["tel_code"]}\", 'name' :\"#{country.attributes["country_name"]}\"},"
        end
      end
      @countriesShow += ']'

      options.delete(:countries)

      if !options[:countries].nil?
        options[:countries].each do | country |
          @countries_options += '<option value' + country.id + '>' + country.name + '</option>'
        end
        options[:countries].delete
        options[:input_html][:countries] = @countries_options
      end

      options[:id] = generate_html_id(method, "")
      options[:input_html] ||= {}
      options[:input_html][:autocomplete] = :off
      options[:input_html][:class] = 'post'
      template.content_for :js do
        template.javascript_tag "document.on('dom:loaded', function() { $('#{options[:id]}').observe('click', respondToClickPost);

function checkEmptyPost(array, id) {
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

function functionSavePost(event){
    var element = Event.element(event);
    var id = element.getAttribute('id');
    id = id.split('save_').join('');

    var withoutDisplay = id.split('_display').join('');
    var ids = ['index_'+id, 'country_'+id, 'region_'+id, 'district_'+id, 'city_'+id, 'street_'+id, 'building_'+id];

    if(!checkEmptyPost(ids, id)){return false;};
    $(id).value = $('index_'+id).getValue() + ', ' + $('country_'+id).options[$('country_'+id).selectedIndex].text + ', ' + $('region_'+id).getValue() + ', '
        + $('district_'+id).getValue() + ', ' + $('city_'+id).getValue() + ', ' +
        $('street_'+id).getValue() + ', ' + $('building_'+id).getValue() + ', ' + $('additional_'+id).getValue();

    $(withoutDisplay+'_index').value = $('index_'+id).getValue();
    $(withoutDisplay+'_country').value = $('country_'+id).getValue();
    $(withoutDisplay+'_region').value = $('region_'+id).getValue();
    $(withoutDisplay+'_district').value = $('district_'+id).getValue();
    $(withoutDisplay+'_city').value = $('city_'+id).getValue();
    $(withoutDisplay+'_street').value = $('street_'+id).getValue();
    $(withoutDisplay+'_building').value = $('building_'+id).getValue();
    $(withoutDisplay+'_additional').value = $('additional_'+id).getValue();
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function respondToClickPost(event) {

    var elementClicked = Event.element(event);
    var id = elementClicked.getAttribute('id');
    var withoutDisplay = id.split('_display').join('');

    var inputs = document.createElement('div');

    var errors = document.createElement('label');
    errors.id = 'errors_' + id;
    inputs.appendChild(errors);

    var label = document.createElement('label');
    label.htmlFor = 'index_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.index"}';
    var index = document.createElement('input');
    index.id = 'index_'+id;
    index.value = $(withoutDisplay+'_index').getValue();
    index.type = 'text';

    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

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
            index.appendChild(child);
        }
    }
    index.id = 'country_'+id;
    index.value = $(withoutDisplay+'_country').getValue();
    index.width = 10;
    index.style.width = '240px';


    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'region_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.region"}';
    var index = document.createElement('input');
    index.id = 'region_'+id;
    index.value = $(withoutDisplay+'_region').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'district_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.district"}';
    var index = document.createElement('input');
    index.id = 'district_'+id;
    index.value = $(withoutDisplay+'_district').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'city_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.settlement"}';
    var index = document.createElement('input');
    index.id = 'city_'+id;
    index.value= $(withoutDisplay+'_city').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'street_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.street"}';
    var index = document.createElement('input');
    index.id = 'street_'+id;
    index.value = $(withoutDisplay+'_street').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var label = document.createElement('label');
    label.htmlFor = 'building_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.house_number"}';
    inputs.appendChild(document.createElement('br'));
    var index = document.createElement('input');
    index.id = 'building_'+id;
    index.value = $(withoutDisplay+'_building').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var label = document.createElement('label');
    label.htmlFor = 'additional_'+id;
    label.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.additional"}';
    var index = document.createElement('input');
    index.id = 'additional_'+id;
    index.value = $(withoutDisplay+'_additional').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var saveButton = document.createElement('button');
    saveButton.id =  'save_'+id;
    saveButton.innerHTML = '#{ ::Formtastic::I18n::t "labels.popup.save"}';
    inputs.appendChild(saveButton);

    saveButton = $(saveButton);
    elementClicked = $(elementClicked);
    inputs = $(inputs);

    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: '#{ ::Formtastic::I18n::t "labels.popup.title_address"}' });
    saveButton.observe('click', functionSavePost);
    elementClicked.prototip.show();
}



  });"
      end
      options[:as].delete if options[:as]
      input(method, options).gsub(/^<li[^>]+>(.*)?<\/li>$/, '\1')
    end
  end
end