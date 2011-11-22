render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
       
parent_pdf.text_field("tid_one", 0, 435, 187, 15)
parent_pdf.text_field("tid_two", 0, 422, 187, 15)
parent_pdf.text_field("tid_free", 0, 410, 187, 15)
parent_pdf.text_field("tid_four", 0, 397, 187, 15)

parent_pdf.text_field("auth_create_day", 262, 280, 17, 15)
parent_pdf.text_field("auth_create_month", 285, 280, 60, 15)
parent_pdf.text_field("auth_create_year", 360, 280, 17, 15)

parent_pdf.text_field("phones", 115, 242, 344, 15)

#parent_pdf.text_field("name_supplier4", 348, 527, 165, 15)
#parent_pdf.text_field("name_supplier4", 0, 514, 333, 15)

parent_pdf.text_field("depozit", 348, 511, 175, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text_field("kredit", 0, 498, 333, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("podp", 78, 216, 300, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text_field("position_agent21512", 0, 355, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 78, 308, 240, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("imenyem", 45, 511, 17, 15)
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