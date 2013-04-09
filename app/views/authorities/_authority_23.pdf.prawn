render :partial => "header_authority_2", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }
      
#parent_pdf.text_field("imenyem", 45, 178-3, 17, 15)
#parent_pdf.text_field("depozit", 280, 177-3, 243, 15, :default => first_string(243, "#{@vars['agent_fio']}" ,0))
#parent_pdf.text_field("kredit", 0, 165-3, 333, 15, :default => first_string(243, "#{@vars['agent_fio']}" ,1))
      
parent_pdf.text_field("tid_one", 0, 102+4, 187, 15)
parent_pdf.text_field("tid_two", 0, 89+1, 187, 15)
parent_pdf.text_field("tid_free", 0, 77-3, 187, 15)
parent_pdf.text_field("tid_four", 0, 64-7, 187, 15)

parent_pdf.text "при заключении депозитных сделок согласно установленным ОАО Московская Биржа «Правилам заключения Банком России сделок с кредитными организациями с использованием Системы электронных торгов ЗАО ММВБ при проведении Банком России депозитных и кредитных операций» с использованием следующих торговых идентификаторов Участника", :align => :justify, :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4
parent_pdf.text "_______________________________", :leading => 4

render :partial => "footer_authority_23",
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }