render :partial => "header_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("ya", 45, 541, 18, 15)
parent_pdf.text_field("vtv_id", 58, 490, 175, 15)
#parent_pdf.text_field("podpis", 255, 404, 125, 15)
#parent_pdf.text_field("phones", 115, 370, 340, 15)

parent_pdf.text_field("agent_fio1", 0, 448, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio2", 48, 398, 370, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 230, 374, 17, 15)
parent_pdf.text_field("auth_create_month", 253, 374, 60, 15)
parent_pdf.text_field("auth_create_year", 329, 374, 17, 15)

#parent_pdf.text_field("phones", 115, 344, 345, 15)
parent_pdf.text_field("phone_code", 91, 344, 23, 15)
parent_pdf.text_field("phone", 120, 344, 265, 15)

#parent_pdf.text_field("podp", 78, 344, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("agent_podpis", 0, 311, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 425, 311, 95, 15, :default => @vars['cfs'])

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении депозитных сделок согласно утвержденным ОАО ММВБ-РТС «Правилам проведения Внешэкономбанком как государственной управляющей компанией средствами пенсионных накоплений депозитных аукционов с использованием Системы электронных торгов ОАО ММВБ-РТС» с использованием следующих идентификаторов Участника:_____________________________", :align => :justify

render :partial => "footer_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }