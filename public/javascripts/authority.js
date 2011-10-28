function changeUser(event, element)
{
	var userFields = ['lastname', 'firstname', 'middlename', 'position'];
	
	userFields.each(function(field) {
		if (element.value == '') {
			$('authority_' + field).show();
			$$('label[for="authority_' + field + '"]')[0].show();
		} else {
			$('authority_' + field).hide();
			$$('[for=authority_' + field + ']')[0].hide();
		}
	});
}

document.on("dom:loaded", function() {
  $('authority_user_id').on('change', changeUser);
});