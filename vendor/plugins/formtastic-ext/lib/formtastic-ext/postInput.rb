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
          @countriesShow += "{'id' : \"#{country.attributes["tel_code"]}\", 'name' :\"#{country.attributes["name"]}\"},"
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

// Функция ввода информации в основное окно.
function functionSavePost(event){
    var element = Event.element(event);
    var id = element.getAttribute('id');
    id = id.split('save_').join('');

    var withoutDisplay = id.split('_display').join('');

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

    var label = document.createElement('label');
    label.htmlFor = 'index_'+id;
    label.innerHTML = 'Индекс';
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
    label.innerHTML = 'Код страны';
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
    index.value = $(withoutDisplay+'_country').getValue();
    index.width = 10;
    index.style.width = '240px';


    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);
    inputs.appendChild(document.createElement('br'));

    var label = document.createElement('label');
    label.htmlFor = 'region_'+id;
    label.innerHTML = 'Регион';
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
    label.innerHTML = 'Район';
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
    label.innerHTML = 'Населенный пункт';
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
    label.innerHTML = 'Улица';
    var index = document.createElement('input');
    index.id = 'street_'+id;
    index.value = $(withoutDisplay+'_street').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var label = document.createElement('label');
    label.htmlFor = 'building_'+id;
    label.innerHTML = 'Номер дома';
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
    label.innerHTML = 'Дополнительная информация';
    var index = document.createElement('input');
    index.id = 'additional_'+id;
    index.value = $(withoutDisplay+'_additional').getValue();
    index.type = 'text';
    inputs.appendChild(label);
    inputs.appendChild(document.createElement('br'));
    inputs.appendChild(index);

    var saveButton = document.createElement('button');
    saveButton.id =  'save_'+id;
    saveButton.innerHTML = 'Сохранить';
    inputs.appendChild(saveButton);


    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: 'Адрес' });
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