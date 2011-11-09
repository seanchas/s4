function do_reset()
  {
    document.getElementById("documentfilter_by_date_start").value = "";
    document.getElementById("documentfilter_by_date_finish").value = "";
    document.getElementById("documentfilter_by_type").value = "";
    document.getElementById("documentfilter_document_name").value = "";
    document.getElementById("documentfilter_by_sender").value = "";
  }

function check_select_bytype()
{
  if ( document.getElementById("documentfilter_by_type").value == 13 )
  {
    document.getElementById("documentfilter_document_name").disabled=false;
  }
  else
  {
    document.getElementById("documentfilter_document_name").disabled=true;
  }
}

document.getElementById("documentfilter_document_name").disabled=true;

document.getElementById('documentfilter_by_type').onchange = function() {
    check_select_bytype();
}
check_select_bytype();
