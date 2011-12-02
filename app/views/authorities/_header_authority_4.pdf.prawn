parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 775, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 749, 120, 15)
parent_pdf.text_field("auth_day", 395, 749, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 749, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 749, 20, 15, :align => 1)

parent_pdf.text_field("position_agent2", 144, 711, 379, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text_field("position_agent32", 0, 687, 523, 15)
parent_pdf.text_field("position_agent212", 40, 670, 483, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
parent_pdf.text_field("deistv", 58, 647, 20, 15)
parent_pdf.text_field("gustav", 148, 646, 242, 15, :default => @vars['document_name'])
parent_pdf.text_field("position_agent223", 0, 629, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 605, 40, 15)
parent_pdf.text_field("passport_num", 129, 605, 60, 15)
parent_pdf.text_field("passport_date", 230, 605, 293, 15)
parent_pdf.text_field("passport_date2", 0, 581, 523, 15)

parent_pdf.text_field("position_agent223", 70, 564, 453, 15, :default => @vars['organization_name'])


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "в лице #{"_"*80},", :leading => 4


#parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :indent_paragraphs => 30, :align => :justify, :leading => 4
#parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250 
#parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*40} доверяет сотруднику,", :leading => 4

parent_pdf.text " #{"_"*87}", :leading => 4

#parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 350
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "представлять #{"_"*75}", :leading => 4

parent_pdf.text "<sup>(ФИО-Участника)</sup>", :inline_format => true, :align => :center