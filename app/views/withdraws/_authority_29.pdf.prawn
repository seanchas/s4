move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ .г\n\n"
parent_pdf.text "Уведомление об отмене аккредитации Трейдера\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name",60, 724-move, 463, 15, :default => first_string(378, "#{@vars['organization_name']}" ,0))

parent_pdf.text_field("position_agent32", 0, 665-move, 523, 15, :default => "#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("position_agent212", 0, 597-move, 436, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("birth_year", 0, 633-move, 523, 15)


parent_pdf.text_field("dayx", 260, 700-move, 23, 15)
parent_pdf.text_field("monthx", 288, 700-move, 80, 15)
parent_pdf.text_field("yearx", 383, 700-move, 23, 15)

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "Настоящим ___________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов )</sup>", :inline_format => true, :align => :center

parent_pdf.text "Уведомляет ОАО Московская Биржа  об отмене с  '____' _____________ 20___г.\nаккредитации", :leading => 4

parent_pdf.text "______________________________________________________________________________________", :align => :justify
parent_pdf.text "<sup>(ФИО аккредитованного Трейдера  участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "аккредитованного на  Срочном рынке FORTS в качестве Трейдера в связи с ", :align => :justify
parent_pdf.text "______________________________________________________________________________________", :align => :justify
parent_pdf.text "<sup>(необходимо указать причину отмены  аккредитации)</sup>", :inline_format => true, :align => :center

parent_pdf.text "Руководитель участника торгов #{"_"*78}.", :leading => 4

parent_pdf.text "<sup>(должность, Ф.И.О., подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50