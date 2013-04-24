parent_pdf.move_down(350)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("auth_num", 303, 424, 35, 15)
parent_pdf.text_field("year", 10, 399, 120, 15)
parent_pdf.text_field("auth_day", 395, 399, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 399, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 399, 20, 15, :align => 1)

parent_pdf.text_field("position_agent2", 144, 361, 379, 15, :default => first_string(379, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent32", 0, 337, 523, 15, :default => first_string(379, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent212", 40, 320, 483, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
parent_pdf.text_field("deistv", 58, 297, 20, 15)
parent_pdf.text_field("gustav", 148, 296, 242, 15, :default => @vars['document_name'])
parent_pdf.text_field("position_agent223", 0, 279, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 77, 255, 40, 15)
parent_pdf.text_field("passport_num", 132, 255, 60, 15)
parent_pdf.text_field("passport_date", 232, 255, 291, 15)
parent_pdf.text_field("passport_date2", 0, 231, 523, 15)

parent_pdf.text_field("position_agent2234", 70, 214, 453, 15, :default => first_string(453, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent32", 0, 197, 523, 15, :default => first_string(379, "#{@vars['organization_name']}" ,1))

parent_pdf.text "\n\n"
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4, :align => :right
parent_pdf.text "<sup>(наименование кредитной организации - Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "в лице  #{"_"*80},", :leading => 4, :align => :right


parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*40} доверяет сотруднику", :leading => 4

parent_pdf.text " #{"_"*86} ,", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия  ______ № __________, выдан  ________________________________________________", :leading => 4, :align => :right
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 350
parent_pdf.text "#{"_"*86} ,", :leading => 4

parent_pdf.text "представлять #{"_"*75}", :leading => 4
parent_pdf.text " #{"_"*87}", :leading => 4

parent_pdf.text "<sup>(Наименование кредитной организации - участника)</sup>", :inline_format => true, :align => :center