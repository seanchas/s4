/*
Функция вывода окна с выбором почтового адреса. Должна работать с каждым отдельным инпутом номера телефона.
 */

function respondToClickPost(event) {

    var elementClicked = Event.element(event);
    var id = elementClicked.getAttribute('id');
    var withoutDisplay = id.split('_display').join('');

    var inputs = Element('div');

    var label = Element('label', {for:'index_'+id});
    label.innerHTML = 'Индекс';
    var index = Element('input', {id:'index_'+id, value:$(withoutDisplay+'_index').getValue(), type:'text'});

    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'country_'+id});
    label.innerHTML = 'Страна';
    var index = Element('input', {id:'country_'+id, value:$(withoutDisplay+'_country').getValue(), type:'text'});

    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'region_'+id});
    label.innerHTML = 'Регион';
    var index = Element('input', {id:'region_'+id, value:$(withoutDisplay+'_region').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'district_'+id});
    label.innerHTML = 'Район';
    var index = Element('input', {id:'district_'+id, value:$(withoutDisplay+'_district').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'city_'+id});
    label.innerHTML = 'Населенный пункт';
    var index = Element('input', {id:'city_'+id, value:$(withoutDisplay+'_city').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'street_'+id});
    label.innerHTML = 'Улица';
    var index = Element('input', {id:'street_'+id, value:$(withoutDisplay+'_street').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);

    var label = Element('label', {for:'building_'+id});
    label.innerHTML = 'Номер дома';
    inputs.appendChild(Element('br'));
    var index = Element('input', {id:'building_'+id, value:$(withoutDisplay+'_building').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);

    var label = Element('label', {for:'additional_'+id});
    label.innerHTML = 'Дополнительная информация';
    var index = Element('input', {id:'additional_'+id, value:$(withoutDisplay+'_additional').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);

    var saveButton = Element('button', {'id': 'save_'+id});
    saveButton.innerHTML = 'Сохранить';
    inputs.appendChild(saveButton);


    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: 'Телефоны' });
    saveButton.observe('click', functionSavePost);
    elementClicked.prototip.show();
}

// Функция ввода информации в основное окно.
function functionSavePost(event){
    var element = Event.element(event);
    var id = element.getAttribute('id');
    id = id.split('save_').join('');

    var withoutDisplay = id.split('_display').join('');

    $(id).value = $('index_'+id).getValue() + ', ' + $('country_'+id).getValue() + ', ' + $('region_'+id).getValue() + ', '
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