render :partial => 'header_authority_2',
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text_field("yaya",44, 178-3, 20, 15)
parent_pdf.text_field("binban",0, 127-19, 225, 15)


#parent_pdf.text_field("podp", 48, 301, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("position_agent21512", 0, 85-12, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text_field("agent_fio1", 48, 39-9, 400, 15, :default => @vars['agent_fio'])

#parent_pdf.text_field("phones", 85, 326, 342, 15)

parent_pdf.text "именуем___ в дальнейшем Участник, при заключении кредитных сделок согласно установленным ОАО Московская Биржа Правилам проведения кредитных аукционов при предоставлении Банком России кредитным организациям кредитов без обеспечения с использованием Системы электронных торгов ЗАО ММВБ с использованием следующих идентификаторов Участника", :align => :justify, :leading => 4
parent_pdf.text "_____________________________________", :leading => 6

render :partial => 'footer_authority_2', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }
