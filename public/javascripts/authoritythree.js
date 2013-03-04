var form = document.getElementById('new_authority');
document.getElementById('authority_type_id').onchange = function() {
	
	form.action = "/withdraws"
	form.method = "get"
	
	var choice_val = document.getElementById('authority_type_id').value;
	window.location.href = "/withdraws?warrant_type_id=" + choice_val
	
	//var fields = form.getElementsByClassName('l-field');
	
	//if( fields.length > 5)
	//{
	//	for(var i = fields.length - 1; i >= 1; i-- )
	//	{
	//		fields[i].parentNode.removeChild(  fields[i] );
	//	}
	//}
	
	//form.submit();
	//var authority_submit = document.getElementById('authority_submit');
	//authority_submit.setAttribute('value','Получить список сотрудников');
}