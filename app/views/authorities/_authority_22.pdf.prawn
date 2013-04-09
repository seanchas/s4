render :partial => 'header_authority_2',
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text_field("yaya",44, 178-3, 20, 15)
parent_pdf.text_field("binban",193, 127-3, 225, 15)


#parent_pdf.text_field("podp", 48, 301, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("position_agent21512", 0, 85-5, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 48, 39-5, 400, 15, :default => @vars['agent_fio'])

#parent_pdf.text_field("phones", 85, 326, 342, 15)

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении кредитных сделок согласно установленным ОАО Московская Биржа Правилам проведения кредитных аукционов при предоставлении Банком России кредитным организациям кредитов без обеспечения с использованием Системы электронных торгов ЗАО ММВБ с использованием следующих идентификаторов Участника", :align => :justify
parent_pdf.text "торговый идентификатор Участника: _____________________________________"

render :partial => 'footer_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
