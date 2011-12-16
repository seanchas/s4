parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold

parent_pdf.text_field("auth_num", 303, 774, 35, 15)

parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 6, 749, 120, 15)
parent_pdf.text_field("auth_day", 397, 749, 16, 15)
parent_pdf.text_field("auth_month", 425, 749, 60, 15)
parent_pdf.text_field("auth_year", 499, 749, 16, 15)

parent_pdf.text_field("name_supplier21", 140, 711, 380, 15, :default => @vars['organization_name'])
parent_pdf.text_field("name_supplier323", 0, 686, 523, 15)

parent_pdf.text_field("position_agent2", 172, 670, 350, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
parent_pdf.text_field("position_agent229", 0, 653, 523, 15)

parent_pdf.text_field("deistv", 58, 629, 20, 15)
parent_pdf.text_field("gustav", 150, 629, 232, 15, :default => @vars['document_name'])
parent_pdf.text_field("upolnomochenii_agent", 90, 616, 433, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("upolnomochenii_agent_two", 0, 592, 523, 15)

parent_pdf.text_field("passport_num", 43, 562, 80, 15)
parent_pdf.text_field("passport_date", 160, 562, 363, 15)
parent_pdf.text_field("passport_date2", 0, 539, 523, 15)



parent_pdf.text "\n\n"



parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text "Настоящей доверенностью #{@vars['organization_name']}", :leading => 4
#parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center


parent_pdf.text "(далее - Участник торгов) в лице #{"_"*58}", :leading => 4
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :align => :center

#parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']}", :leading => 4
#parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center

parent_pdf.text "действующ___ на основании #{"_"*39},"

parent_pdf.text "уполномочивает #{"_"*72}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "(далее - Трейдер)"
parent_pdf.text "паспорт _____________, выдан ____________________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "_______________________________________________________________________________________", :leading => 4

