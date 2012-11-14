render :partial => 'header_authority_3', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
       
#parent_pdf.text_field("yaya",45, 174, 16, 15)
parent_pdf.text_field("tid_one", 0, 163, 187, 15)
parent_pdf.text_field("tid_two", 0, 150, 187, 15)
parent_pdf.text_field("tid_free", 0, 137, 187, 15)
parent_pdf.text_field("tid_four", 0, 124, 187, 15)

parent_pdf.text "представлять Участника при совершении сделок с Облигациями согласно установленному ОАО Московская Биржа “Регламенту проведения операций в Системе электронных торгов по сделкам с государственными и иными ценными бумагами” с использованием следующих торговых идентификаторов Участника", :align => :justify
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"

render :partial => 'footer_authority_3', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }