render :partial => 'header_authority_3', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
       
parent_pdf.text_field("yaya",45, 507, 16, 15)
parent_pdf.text_field("tid_one", 0, 444, 187, 15)
parent_pdf.text_field("tid_two", 0, 431, 187, 15)
parent_pdf.text_field("tid_free", 0, 418, 187, 15)
parent_pdf.text_field("tid_four", 0, 405, 187, 15)

parent_pdf.text "именуем___ в дальнейшем Участник, при совершении сделок с Облигациями согласно установленному ЗАО ММВБ «Регламенту проведения операций в Системе электронных торгов по сделкам с государственными и иными ценными бумагами» с использованием технического доступа к программно-техническому комплексу ЗАО ММВБ (ПТК ММВБ) и с использованием следующих торговых идентификаторов Участника:", :align => :justify
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"
parent_pdf.text "_______________________________"

render :partial => 'footer_authority_3', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }