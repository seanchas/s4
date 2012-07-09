render :partial => "header_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("ya", 45, 524, 18, 15)
parent_pdf.text_field("vtv_id", 150, 473, 175, 15)
#parent_pdf.text_field("podpis", 255, 387, 125, 15)
#parent_pdf.text_field("phones", 115, 353, 340, 15)

parent_pdf.text_field("agent_fio1", 0, 431, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio2", 48, 381, 370, 15, :default => @vars['agent_fio'])

#parent_pdf.text_field("auth_create_day", 230, 374, 17, 15)
#parent_pdf.text_field("auth_create_month", 253, 374, 60, 15)
#parent_pdf.text_field("auth_create_year", 329, 374, 17, 15)

#parent_pdf.text_field("phones", 115, 350, 345, 15)
parent_pdf.text_field("phone_code", 91, 333, 23, 15)
parent_pdf.text_field("phone", 120, 333, 265, 15)

#parent_pdf.text_field("podp", 78, 350, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

#parent_pdf.text_field("agent_podpis", 0, 300, 300, 15, :default => @vars['ceo_position'])
#parent_pdf.text_field("name_podp", 425, 300, 95, 15, :default => @vars['cfs'])

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении депозитных сделок согласно утвержденным ОАО Московская Биржа «Правилам проведения Внешэкономбанком как государственной управляющей компанией средствами пенсионных накоплений депозитных аукционов с использованием Системы электронных торгов ЗАО ММВБ» с использованием следующих идентификаторов Участника:_____________________________", :align => :justify

render :partial => "footer_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }