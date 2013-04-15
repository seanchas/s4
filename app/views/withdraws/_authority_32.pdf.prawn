move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ г.                                                            в ОАО Московская Биржа\n\n\n\n"
parent_pdf.text "Уведомление об отмене Доверенности\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name",60, 724-move-26, 463, 15, :default => first_string(463, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organisation_name2",0, 724-move-25-26, 520, 15, :default => first_string(463, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent32", 30, 665-move-17-25, 493, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("authority_num", 95, 665-move-24, 86, 15, :default => "#{@vars['authority_num']}")
parent_pdf.text_field("authority_date", 190, 665-move-24, 86, 15, :default => "#{@vars['authority_date']}")

parent_pdf.text_field("vsvyazy", 0, 600-move-8-17-26, 436, 15)

parent_pdf.text_field("position_agent212", 0, 565-move-13-17-26, 218+40, 15, :default => "#{@vars['ceo_position']}")
parent_pdf.text_field("position_agent212a", 245+40, 565-move-13-17-26, 150, 15, :default => "#{@vars['ceo_fio']}")

parent_pdf.text_field("birth_year", 0, 633-move-4-17-26, 523, 15, :default => "курьера")


parent_pdf.text_field("dayx", 312-5-3-2, 700-move-17-26, 23, 15)
parent_pdf.text_field("monthx", 340-5-3, 700-move-17-26, 80, 15)
parent_pdf.text_field("yearx", 435-5-3, 700-move-17-26, 23, 15)

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "Настоящим ___________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center

parent_pdf.text "_____________________________________________________________________________________", :leading => 4

parent_pdf.text "уведомляет ОАО Московская Биржа об отмене (отзыве) с \"____\" _____________ 20___г.\nДоверенности  № _______________   ______________г.", :leading => 4

parent_pdf.text "на ___________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup>(ФИО  представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "аккредитованного на  ОАО Московская Биржа в качестве", :align => :justify
parent_pdf.text "______________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup> </sup>", :inline_format => true, :align => :center

parent_pdf.text "в связи с", :align => :justify
parent_pdf.text "______________________________________________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "<sup>(необходимо указать причину отмены  аккредитации)</sup>", :inline_format => true, :align => :center

parent_pdf.text "Руководитель Участника торгов", :leading => 4
parent_pdf.text "___________________________________________       ___________________________/_____________", :leading => 4

parent_pdf.text "<sup>.                                    (должность)                                                                                                                       (Ф.И.О.)                                                 (подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50