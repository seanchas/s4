move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ г.\n\n"
parent_pdf.text "Уведомление об отмене аккредитации Трейдера\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name",68, 724-move, 455, 15, :default => first_string(463, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organisation_name2",0, 724-move-25, 523, 15, :default => first_string(463, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent32", 0, 665-move-17, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("position_agent212a", 330, 565-move+6, 192, 15, :default => "#{@vars['ceo_fio']}")
parent_pdf.text_field("position_agent212", 0, 565-move+6, 228, 15, :default => "#{@vars['ceo_position']}")

parent_pdf.text_field("birth_year", 0, 633-move-4-17, 523, 15)

parent_pdf.text_field("dayx", 263, 700-move-17, 23, 15)
parent_pdf.text_field("monthx", 294, 700-move-17, 80, 15)
parent_pdf.text_field("yearx", 388, 700-move-17, 16, 15)

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "Настоящим  ____________________________________________________________________________", :leading => 4, :align => :right

parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center

parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "Уведомляет ОАО Московская Биржа  об отмене с  \"____\" _____________ 20___г.\nаккредитации", :leading => 4

parent_pdf.text "#{"_"*87}", :align => :justify, :leading => 4
parent_pdf.text "<sup>(ФИО аккредитованного Трейдера  участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "аккредитованного на  Срочном рынке FORTS в качестве Трейдера в связи с ", :align => :justify
parent_pdf.text "#{"_"*87}", :align => :justify, :leading => 4
parent_pdf.text "<sup>(необходимо указать причину отмены  аккредитации)</sup>", :inline_format => true, :align => :center

parent_pdf.text "Руководитель участника торгов", :leading => 4
parent_pdf.text "______________________________________    ______________/________________________________", :leading => 4

parent_pdf.text "<sup>(должность)#{" "*80}(подпись)#{" "*71}(Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 89
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50