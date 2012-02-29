function setupCalendars() {
	// Embedded Calendar
	Calendar.setup(
	  {
	    dateField: 'organizations_search_notice_start_date',
	    triggerElement: 'organizations_search_notice_start_date'
	  }
	)
	
	// Popup Calendar
	Calendar.setup(
	  {
	    dateField: 'organizations_search_notice_end_date',
	    triggerElement: 'organizations_search_notice_end_date'
	  }
	)
}

Event.observe(window, 'load', function() { setupCalendars() });

function do_reset()
{
  document.getElementById("organizations_search_notice_notice_priority").value = "";
  document.getElementById("organizations_search_notice_status").value = "";
  document.getElementById("organizations_search_notice_start_date").value = "";
  document.getElementById("organizations_search_notice_end_date").value = "";
  document.getElementById("organizations_search_notice_search_text").value = "";
}