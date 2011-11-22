parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 6, 749, 120, 15)
parent_pdf.text_field("auth_day", 398, 749, 16, 15)
parent_pdf.text_field("auth_month", 424, 749, 60, 15)
parent_pdf.text_field("auth_year", 498, 749, 16, 15)

parent_pdf.text_field("ya", 63, 642, 13, 15)

parent_pdf.text_field("passport_ser", 74, 588, 40, 15)
parent_pdf.text_field("passport_num", 129, 588, 60, 15)
parent_pdf.text_field("passport_date", 230, 588, 293, 15)
parent_pdf.text_field("passport_date2", 0, 564, 523, 15)


parent_pdf.text "\n"
parent_pdf.text "\n"


parent_pdf.text_field("name_supplier4", 173, 711, 350, 15, :default => @vars['organization_name'])
parent_pdf.text "Настоящей Доверенностью #{"_"*58}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text_field("name_supplier323", 0, 683, 523, 15)



parent_pdf.text_field("licoco", 35, 666, 488, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center


parent_pdf.text "действующе__ на основании #{@vars['document_name']},"


parent_pdf.text_field("licoco", 110, 629, 413, 15, :default => "#{@vars['agent_position']}")
parent_pdf.text "доверяет сотруднику #{"_"*68}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text_field("licoco", 0, 605, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text "#{"_"*87}", :leading => 4



parent_pdf.text "паспорт серия ______ № __________, выдан _________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 370
parent_pdf.text "#{"_"*87}", :leading => 4



parent_pdf.text_field("bankk", 70, 548, 453, 15, :default => @vars['organization_name'])
parent_pdf.text "представлять #{"_"*75}", :leading => 4
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center

parent_pdf.text_field("yazz", 0, 524, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "представлять #{@vars['organization_name']}", :leading => 4