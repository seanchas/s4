render :partial => 'header_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text_field("yaya",44, 528, 20, 15)
parent_pdf.text_field("binban",263, 477, 225, 15)

parent_pdf.text_field("auth_create_day", 262, 360, 17, 15)
parent_pdf.text_field("auth_create_month", 285, 360, 60, 15)
parent_pdf.text_field("auth_create_year", 360, 360, 17, 15)

parent_pdf.text_field("podp", 78, 296, 300, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")

parent_pdf.text_field("phones", 115, 322, 342, 15)
parent_pdf.text_field("position_agent21512", 0, 435, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("agent_fio1", 78, 388, 240, 15, :default => @vars['agent_fio'])

parent_pdf.text "именуем___ в дальнейшем Участник/Банк России, при заключении кредитных сделок согласно установленным ЗАО ММВБ Правилам проведения кредитных аукционов при предоставлении Банком России кредитным организациям кредитов без обеспечения с использованием Системы электронных торгов ЗАО ММВБ с использованием следующих идентификаторов Участника/Банка России", :align => :justify
parent_pdf.text "торговый идентификатор Участника/Банка России: _____________________________________"

render :partial => 'footer_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
