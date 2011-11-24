render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("tid_one", 0, 452, 187, 15)
parent_pdf.text_field("tid_two", 0, 439, 187, 15)
parent_pdf.text_field("tid_free", 0, 427, 187, 15)
parent_pdf.text_field("tid_four", 0, 414, 187, 15)

parent_pdf.text_field("yaya",45, 528, 19, 15)

#parent_pdf.text_field("sdelka",355, 578, 170, 15)
#parent_pdf.text_field("sdelka_two",0, 579, 330, 15)

parent_pdf.text_field("auth_create_day", 232, 301, 17, 15)
parent_pdf.text_field("auth_create_month", 255, 301, 60, 15)
parent_pdf.text_field("auth_create_year", 330, 301, 17, 15)

#parent_pdf.text_field("podp", 48, 238, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
parent_pdf.text_field("position_agent21512", 0, 372, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 48, 325, 400, 15, :default => @vars['agent_fio'])


parent_pdf.text_field("depozit", 348, 528, 175, 15)
parent_pdf.text_field("kredit", 0, 515, 330, 15)


parent_pdf.text_field("agent_podpis", 0, 237, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 237, 95, 15, :default => @vars['cfs'])

#parent_pdf.text_field("phones", 85, 263, 343, 15)
parent_pdf.text_field("phone_code", 92, 263, 22, 15)
parent_pdf.text_field("phone", 120, 263, 265, 15)

parent_pdf.text "именуем___ в дальнейшем Участник/Банк России, при заключении _____________________________"
parent_pdf.text "_______________________________________________________ депозитных и кредитных сделок согласно установленным ЗАО ММВБ Правилам заключения Банком России сделок с кредитными организациями с использованием Системы электронных торгов ЗАО ММВБ при проведении Банком России депозитных и кредитных операций с использованием следующих торговых идентификаторов Участника/Банка России:", :align => :justify
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"

render :partial => "footer_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }