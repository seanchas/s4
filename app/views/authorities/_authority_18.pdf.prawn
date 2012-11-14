parent_pdf.move_down(350)

render :partial => 'header_authority',
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text_field("birzha", 0, 134, 523, 15, :default => "Открытым акционерным обществом «Московская Биржа ММВБ-РТС»")

parent_pdf.text "выполнять следующие действия от имени Участника торгов:", :align => :justify
parent_pdf.text "объявлять (подавать, изменять, отзывать ранее поданные) заявки и заключать договоры, являющиеся производными финансовыми инструментами, на торгах, организуемых", :align => :justify
parent_pdf.text "_______________________________________________________________________________________", :leading => 4
parent_pdf.text "(далее – Биржа),\n\n"
parent_pdf.text "получать, предоставлять и подписывать документы и осуществлять иные действия, предусмотренные внутренними документами Биржи, устанавливающими требования к организации торговли.", :align => :justify
parent_pdf.text "\n\n\n" 

render :partial => 'footer_authority', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }