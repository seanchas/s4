render :partial => 'header_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text_field("yaya",44, 528, 20, 15)
parent_pdf.text_field("binban",193, 477, 225, 15)


#parent_pdf.text_field("podp", 48, 301, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("position_agent21512", 0, 435, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 48, 389, 400, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("auth_create_day", 232, 364, 17, 15)
parent_pdf.text_field("auth_create_month", 255, 364, 60, 15)
parent_pdf.text_field("auth_create_year", 330, 364, 17, 15)

#parent_pdf.text_field("phones", 85, 326, 342, 15)

parent_pdf.text_field("phone_code", 92, 326, 22, 15)
parent_pdf.text_field("phone", 120, 326, 265, 15)

parent_pdf.text_field("agent_podpis", 0, 301, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 301, 95, 15, :default => @vars['cfs'])

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении кредитных сделок согласно установленным ОАО ММВБ-РТС Правилам проведения кредитных аукционов при предоставлении Банком России кредитным организациям кредитов без обеспечения с использованием Системы электронных торгов ОАО ММВБ-РТС с использованием следующих идентификаторов Участника", :align => :justify
parent_pdf.text "торговый идентификатор Участника: _____________________________________"

render :partial => 'footer_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
