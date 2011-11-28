parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 774, 35, 15)

parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 8, 749, 120, 15)
parent_pdf.text_field("auth_day", 398, 749, 16, 15)
parent_pdf.text_field("auth_month", 424, 749, 60, 15)
parent_pdf.text_field("auth_year", 498, 749, 16, 15)

parent_pdf.text_field("position_agent2", 144, 711, 379, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text_field("position_agent32", 0, 687, 523, 15)
parent_pdf.text_field("position_agent212", 40, 670, 483, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("deistv", 57, 646, 18, 15)
parent_pdf.text_field("gustav", 148, 646, 85, 15, :default => @vars['document_name'])

parent_pdf.text_field("position_agent2234", 0, 633, 523, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("passport_ser", 74, 609, 40, 15)
parent_pdf.text_field("passport_num", 129, 609, 60, 15)
parent_pdf.text_field("passport_date", 230, 609, 293, 15)
parent_pdf.text_field("passport_date2", 0, 585, 523, 15)

parent_pdf.text_field("bankk", 70, 569, 453, 15, :default => @vars['organization_name'])
parent_pdf.text_field("yazz", 0, 544, 523, 15)


parent_pdf.text " "
parent_pdf.text " "



parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*14}, доверяет сотруднику"

parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 200

parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4


parent_pdf.text "представлять #{"_"*75}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :align => :center

parent_pdf.text "#{"_"*87}", :leading => 4