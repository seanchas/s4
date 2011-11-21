render :partial => "header_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }

parent_pdf.text_field("yaya", 62, 670, 15, 13)
parent_pdf.text_field("vtv_id", 235, 489, 175, 15)
#parent_pdf.text_field("podpis", 255, 400, 125, 15)
#parent_pdf.text_field("phones", 115, 365, 340, 15)

parent_pdf.text_field("agent_fio1", 0, 446, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio2", 78, 410, 237, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 260, 383, 17, 15)
parent_pdf.text_field("auth_create_month", 283, 383, 60, 15)
parent_pdf.text_field("auth_create_year", 358, 384, 12, 15)
parent_pdf.text_field("phones", 115, 343, 350, 15)
parent_pdf.text_field("podp", 78, 319, 200, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")

parent_pdf.text "именуем___ в дальнейшем Участник/Внешэкономбанк, при заключении депозитных сделок согласно утвержденным ЗАО ММВБ «Правилам проведения Внешэкономбанком как государственной управляющей компанией средствами пенсионных накоплений депозитных аукционов с использованием Системы электронных торгов ЗАО ММВБ» с использованием следующих идентификаторов Участника/Внешэкономбанка:", :align => :justify
parent_pdf.text "идентификатор Участника/Внешэкономбанка _____________________________"

render :partial => "footer_authority_4", 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars       => @vars
       }