render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }

parent_pdf.text "именуем___ в дальнейшем Участник/Банк России, при заключении "
parent_pdf.text "________________________________________________________________________ депозитных и кредитных сделок"
parent_pdf.text "согласно установленным ЗАО ММВБ Правилам заключения Банком России сделок с кредитными организациями с использованием Системы электронных торгов ЗАО ММВБ при проведении Банком России депозитных и кредитных операций с использованием следующих торговых идентификаторов Участника/Банка России:"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"

render :partial => "footer_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }