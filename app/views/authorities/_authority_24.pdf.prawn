render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("tid_one", 0, 451, 187, 15)
parent_pdf.text_field("tid_two", 0, 438, 187, 15)
parent_pdf.text_field("tid_free", 0, 426, 187, 15)
parent_pdf.text_field("tid_four", 0, 413, 187, 15)

parent_pdf.text_field("yaya",44, 527, 19, 15)

#parent_pdf.text_field("sdelka",348, 577, 170, 15)
#parent_pdf.text_field("sdelka_two",0, 562, 330, 15)

parent_pdf.text_field("auth_create_day", 262, 296, 17, 15)
parent_pdf.text_field("auth_create_month", 285, 296, 60, 15)
parent_pdf.text_field("auth_create_year", 360, 296, 12, 15)

parent_pdf.text_field("phones", 115, 259, 350, 15)

parent_pdf.text_field("podp", 78, 232, 200, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text_field("position_agent21512", 0, 371, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 78, 324, 237, 15, :default => @vars['agent_fio'])


parent_pdf.text_field("depozit", 348, 527, 165, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text_field("kredit", 0, 514, 325, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text "именуем___ в дальнейшем Участник/Банк России, при заключении ____________________________"
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