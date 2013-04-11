move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ .г\n\n"
parent_pdf.text "Уведомление об отмене аккредитации Трейдера\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name",60, 724-move, 463, 15, :default => first_string(378, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organisation_name2",0, 724-move-25, 520, 15, :default => first_string(378, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent32", 30, 665-move-17, 493, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("vsvyazy", 0, 600-move-8-17, 436, 15)

parent_pdf.text_field("position_agent212", 0, 565-move-13-17, 436, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("birth_year", 0, 633-move-4-17, 523, 15)

parent_pdf.text_field("authority_num", 114, 665-move, 86, 15, :default => "#{@vars['authority_num']}")
parent_pdf.text_field("authority_date", 210, 665-move, 86, 15, :default => "#{@vars['authority_date']}")


parent_pdf.text_field("dayx", 312, 700-move-17, 23, 15)
parent_pdf.text_field("monthx", 340, 700-move-17, 80, 15)
parent_pdf.text_field("yearx", 435, 700-move-17, 23, 15)

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "Настоящим ___________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center

parent_pdf.text "_____________________________________________________________________________________", :leading => 4


parent_pdf.text "уведомляет «ОАО Московская Биржа» об отмене (отзыве) с '____' _____________ 20___г.\nДоверенности(ей)  № _______________   ______________г.", :leading => 4

parent_pdf.text "на ___________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup>(ФИО аккредитованного Представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "аккредитованного на  «ОАО Московская Биржа» в качестве", :align => :justify
parent_pdf.text "______________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup>(Трейдера/Курьера)</sup>", :inline_format => true, :align => :center

parent_pdf.text "в связи с", :align => :justify
parent_pdf.text "______________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup>(необходимо указать причину отмены  аккредитации)</sup>", :inline_format => true, :align => :center

parent_pdf.text "Руководитель Участника торгов #{"_"*78}.", :leading => 4

parent_pdf.text "<sup>(должность, Ф.И.О., подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50