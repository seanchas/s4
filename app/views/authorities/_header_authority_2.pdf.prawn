parent_pdf.move_down(350)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 424, 35, 15)

parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 8, 399, 120, 15)
parent_pdf.text_field("auth_day", 398, 399, 16, 15)
parent_pdf.text_field("auth_month", 424, 399, 60, 15)
parent_pdf.text_field("auth_year", 498, 399, 16, 15)

parent_pdf.text_field("position_agent2", 144, 361, 379, 15, :default => first_string(379, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent32", 0, 337, 523, 15, :default => first_string(379, "#{@vars['organization_name']}" ,1))
parent_pdf.text_field("position_agent212", 40, 320, 483, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("deistv", 57, 296, 18, 15)
parent_pdf.text_field("gustav", 150, 296, 240, 15, :default => @vars['document_name'])

parent_pdf.text_field("position_agent2234", 0, 283, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 259, 40, 15)
parent_pdf.text_field("passport_num", 129, 259, 60, 15)
parent_pdf.text_field("passport_date", 230, 259, 293, 15)
parent_pdf.text_field("passport_date2", 0, 235, 523, 15)

parent_pdf.text_field("bankk", 70, 219, 453, 15, :default => first_string(453, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("yazz", 0, 194, 523, 15, :default => first_string(453, "#{@vars['organization_name']}" ,1))


parent_pdf.text " "
parent_pdf.text " "



parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*40}, доверяет сотруднику"

parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 200

parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4


parent_pdf.text "представлять #{"_"*75}", :leading => 4
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :align => :center

parent_pdf.text "#{"_"*87}", :leading => 4