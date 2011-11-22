parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 774, 35, 15)

parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 8, 749, 120, 15)
parent_pdf.text_field("auth_day", 398, 749, 16, 15)
parent_pdf.text_field("auth_month", 424, 749, 60, 15)
parent_pdf.text_field("auth_year", 498, 749, 16, 15)

parent_pdf.text_field("ya",63, 646, 13, 15)

parent_pdf.text_field("passport_ser", 74, 593, 40, 15)
parent_pdf.text_field("passport_num", 129, 593, 60, 15)
parent_pdf.text_field("passport_date", 230, 593, 293, 15)
parent_pdf.text_field("passport_date2", 0, 568, 523, 15)


parent_pdf.text " "
parent_pdf.text " "


parent_pdf.text_field("position_agent2", 144, 711, 379, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text_field("position_agent32", 0, 687, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text_field("position_agent212", 40, 670, 483, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 90
parent_pdf.text "действующе__ на основании #{@vars['document_name']},"



parent_pdf.text_field("position_agent223", 110, 633, 413, 15, :default => @vars['agent_position'])
parent_pdf.text "доверяет сотруднику #{"_"*68}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text_field("position_agent2234", 0, 609, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4


parent_pdf.text_field("bankk", 70, 552, 453, 15, :default => @vars['organization_name'])
parent_pdf.text "представлять #{"_"*75}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 150

parent_pdf.text_field("yazz", 0, 527, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4