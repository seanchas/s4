/*
Функция вывода окна с выбором номера телефона. Должна работать с каждым отдельным инпутом номера телефона.

!!!
Остается на будущее. К сожалению, ослик не может это воспроизвести.
 */

function respondToClick(event) {

    var elementClicked = Event.element(event);
    var id = elementClicked.getAttribute('id');
    var withoutDisplay = id.split('_display').join('');

    var inputs = Element('div', {id: 'idIE'});
    inputs = $('idIE');

    var label = Element('label', {for:'country_'+id});
    label.innerHTML = 'Код страны';
    var index = Element('input', {id:'country_'+id, value:$(withoutDisplay+'_country_code').getValue(), type:'text', maxlength: 5, width:10});

    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'towncode_'+id});
    label.innerHTML = 'Код города';
    var index = Element('input', {id:'towncode_'+id, value:$(withoutDisplay+'_areacode').getValue(), type:'text', maxlength: 5, width:10});

    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'phone_'+id});
    label.innerHTML = 'Номер телефона';
    var index = Element('input', {id:'phone_'+id, value:$(withoutDisplay+'_number').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);
    inputs.appendChild(Element('br'));

    var label = Element('label', {for:'additional_'+id});
    label.innerHTML = 'Добавочный';
    var index = Element('input', {id:'additional_'+id, value:$(withoutDisplay+'_internal_number').getValue(), type:'text'});
    inputs.appendChild(label);
    inputs.appendChild(Element('br'));
    inputs.appendChild(index);

    var saveButton = Element('button', {'id': 'save_'+id});
    saveButton.innerHTML = 'Сохранить';
    inputs.appendChild(saveButton);


    var tip = new Tip(elementClicked, inputs, { hook : {target: 'bottomMiddle', tip: 'topMiddle'}, showOn: false, closeButton:true, hideOn: 'closeButton', fixed: false, title: 'Телефоны' });
    saveButton.observe('click', functionSave);
    elementClicked.prototip.show();
}

// Функция ввода информации в основное окно.
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

