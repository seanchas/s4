document.on("dom:loaded", function() {
  if ($('reg_card_errors')) {
	  $('reg_card_errors').select(".reg_card_resource a.show_errors").each(function(e){
		  e.on('click', show_errors)
	  });
  }
});

function show_errors(e)
{
	Event.stop(e);
	var el = $($(this).parentNode.parentNode.parentNode).select("ul li.all_errors").first();
	$(this).update($(el).readAttribute((el.style.display == "none") ? 'hide_message' : 'show_message'));
	el.toggle();
}
