render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
parent_pdf.text_field("yaya",45, 177-4, 19, 15)

#parent_pdf.text_field("depozit", 280, 527, 243, 15, :default => first_string(243, "#{@vars['agent_fio']}" ,0))
#parent_pdf.text_field("kredit", 0, 515, 330, 15, :default => first_string(243, "#{@vars['agent_fio']}" ,1))
 
parent_pdf.text_field("tid_one", 0, 102-12, 187, 15)
parent_pdf.text_field("tid_two", 0, 89-15, 187, 15)
parent_pdf.text_field("tid_free", 0, 77-20, 187, 15)
parent_pdf.text_field("tid_four", 0, 64-21-4, 187, 15)

#parent_pdf.text_field("position_agent21512", 0, 22-4, 523, 15, :default => @vars['agent_fio'])


parent_pdf.text "именуем___ в дальнейшем Участник, при заключении кредитных сделок согласно установленным ОАО Московская Биржа «Правилам заключения Банком России сделок с кредитными организациями с использованием Системы электронных торгов ЗАО ММВБ при проведении Банком России депозитных и кредитных операций» с использованием следующих торговых идентификаторов Участника:", :align => :justify, :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4

render :partial => "footer_authority_24",
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }