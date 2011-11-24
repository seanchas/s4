render :partial => "header_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }

parent_pdf.text_field("deistv", 58, 672, 20, 15)
parent_pdf.text_field("vtv_id", 247, 515, 175, 15)
#parent_pdf.text_field("podpis", 255, 429, 125, 15)
#parent_pdf.text_field("phones", 115, 395, 340, 15)

parent_pdf.text_field("agent_fio1", 0, 473, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio2", 78, 436, 370, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 260, 408, 17, 15)
parent_pdf.text_field("auth_create_month", 283, 408, 60, 15)
parent_pdf.text_field("auth_create_year", 359, 408, 17, 15)

#parent_pdf.text_field("phones", 115, 369, 345, 15)
parent_pdf.text_field("phone_code", 121, 369, 23, 15)
parent_pdf.text_field("phone", 150, 369, 265, 15)

#parent_pdf.text_field("podp", 78, 344, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("agent_podpis", 0, 345, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 345, 95, 15, :default => @vars['cfs'])

parent_pdf.text "именуем___ в дальнейшем Участник/Внешэкономбанк, при заключении депозитных сделок согласно утвержденным ЗАО ММВБ «Правилам проведения Внешэкономбанком как государственной управляющей компанией средствами пенсионных накоплений депозитных аукционов с использованием Системы электронных торгов ЗАО ММВБ» с использованием следующих идентификаторов Участника/Внешэкономбанка:_____________________________", :align => :justify

render :partial => "footer_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }