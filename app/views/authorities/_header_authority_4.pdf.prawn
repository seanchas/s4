parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 773, 35, 15)
parent_pdf.text "г._____________________"
parent_pdf.text_field("year", 7, 749, 125, 15)

parent_pdf.text_field("ya", 45, 553, 18, 15)

parent_pdf.text_field("passport_ser", 74, 618, 40, 15)
parent_pdf.text_field("passport_num", 129, 618, 60, 15)
parent_pdf.text_field("passport_date", 230, 618, 290, 15)
parent_pdf.text_field("passport_date2", 0, 595, 523, 15)


parent_pdf.text_field("position_agent2", 144, 735, 380, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text_field("position_agent32", 0, 711, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text_field("position_agent212", 40, 694, 480, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4


#parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :indent_paragraphs => 30, :align => :justify, :leading => 4
#parent_pdf.text "<sup>(наименование организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250 
#parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 60
parent_pdf.text "действующе__ на основании #{@vars['document_name']},"


parent_pdf.text_field("position_agent223", 110, 659, 403, 15, :default => @vars['agent_position'])
parent_pdf.text "доверяет сотруднику #{"_"*65}", :leading => 4
parent_pdf.text_field("position_agent2234", 0, 643, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 180
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 280
parent_pdf.text "_____________________________________________________________________________________", :leading => 4
parent_pdf.text "представлять #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :indent_paragraphs => 220