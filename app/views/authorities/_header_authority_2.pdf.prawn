parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 773, 35, 15)

parent_pdf.text "г.____________________#{" "*90}«__» __________ 20__г."
parent_pdf.text_field("year", 8, 748, 120, 15)
parent_pdf.text_field("auth_day", 402, 748, 13, 15)
parent_pdf.text_field("auth_month", 424, 748, 60, 15)
parent_pdf.text_field("auth_year", 498, 748, 13, 15)

parent_pdf.text_field("ya",68, 645, 13, 15)

parent_pdf.text_field("passport_ser", 74, 593, 40, 15)
parent_pdf.text_field("passport_num", 129, 593, 60, 15)
parent_pdf.text_field("passport_date", 230, 593, 290, 15)
parent_pdf.text_field("passport_date2", 0, 568, 523, 15)


parent_pdf.text " "
parent_pdf.text " "


parent_pdf.text_field("position_agent2", 144, 711, 380, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text_field("position_agent32", 0, 685, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text_field("position_agent212", 40, 670, 480, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 90
parent_pdf.text "действующее__ на основании #{@vars['document_name']},"



parent_pdf.text_field("position_agent223", 110, 633, 403, 15, :default => @vars['agent_position'])
parent_pdf.text "доверяет сотруднику #{"_"*65}", :leading => 4
parent_pdf.text_field("position_agent2234", 0, 616, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "_____________________________________________________________________________________", :leading => 4


parent_pdf.text_field("bankk", 70, 551, 433, 15, :default => @vars['organization_name'])
parent_pdf.text "представлять #{"_"*73}", :leading => 4



parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 150