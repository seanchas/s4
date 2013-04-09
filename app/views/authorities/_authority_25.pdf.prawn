render :partial => "header_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("ya", 45, 174, 18, 15)
parent_pdf.text_field("vtv_id", 150, 123, 175, 15)

parent_pdf.text_field("agent_fio1", 0, 81, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio2", 48, 33, 370, 15, :default => @vars['agent_fio'])

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении депозитных сделок согласно утвержденным ОАО Московская Биржа «Правилам проведения Внешэкономбанком как государственной управляющей компанией средствами пенсионных накоплений депозитных аукционов с использованием Системы электронных торгов ЗАО ММВБ» с использованием следующих идентификаторов Участника:_____________________________", :align => :justify

render :partial => "footer_authority_2",
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }