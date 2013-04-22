move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ г.                                                            в ОАО Московская Биржа\n\n\n\n"
parent_pdf.text "Уведомление об отмене Доверенности\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name",68, 724-move-26, 455, 15, :default => first_string(463, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organisation_name2",0, 724-move-25-26, 523, 15, :default => first_string(463, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent32", 30, 665-move-17-25, 493, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("authority_num", 95, 665-move-24, 86, 15, :default => "#{@vars['authority_num']}")
parent_pdf.text_field("authority_date", 200, 665-move-24, 66, 15, :default => "#{@vars['authority_date']}")
#parent_pdf.text_field("authority_date_day", 208, 665-move-24, 18, 15, :default => "#{@vars['authority_date_day']}")
#parent_pdf.text_field("authority_date_month", 237, 665-move-24, 78, 15, :default => "#{@vars['authority_date_month']}")
#parent_pdf.text_field("authority_date_year", 318, 665-move-24, 30, 15, :default => "#{@vars['authority_date_year']}")

parent_pdf.text_field("vsvyazy", 0, 600-move-17-26, 523, 15)

parent_pdf.text_field("position_agent212", 0, 565-move-13-17-26+8+1, 228, 15, :default => "#{@vars['ceo_position']}")
parent_pdf.text_field("position_agent212a", 250, 565-move-13-17-26+8+1, 188, 15, :default => "#{@vars['ceo_fio']}")

parent_pdf.text_field("birth_year", 0, 633-move-4-17-26, 523, 15, :default => "Трейдера")


parent_pdf.text_field("dayx", 312-10, 700-move-17-26, 23, 15)
parent_pdf.text_field("monthx", 340-8, 700-move-17-26, 80, 15)
parent_pdf.text_field("yearx", 435-8, 700-move-17-26, 16, 15)

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "Настоящим  ____________________________________________________________________________", :leading => 4, :align => :right

parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center

parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "уведомляет ОАО Московская Биржа об отмене (отзыве) с \"____\" _____________ 20___г.\nДоверенности  № _______________ от ___________г.", :leading => 4
#parent_pdf.text "уведомляет ОАО Московская Биржа об отмене (отзыве) с \"____\" _____________ 20___г.\nДоверенности  № _______________ от \"____\" _____________ _____г.", :leading => 4

parent_pdf.text "на  ____________________________________________________________________________________", :align => :right, :leading => 4
parent_pdf.text "<sup>(ФИО  представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "аккредитованного на  ОАО Московская Биржа в качестве", :align => :justify
parent_pdf.text "#{"_"*87}", :align => :justify, :leading => 4
parent_pdf.text "<sup></sup>", :inline_format => true, :align => :center

parent_pdf.text "в связи с", :align => :justify
parent_pdf.text "#{"_"*87}", :align => :justify, :leading => 4
parent_pdf.text "<sup>(необходимо указать причину отмены  вышеуказанной  доверенности)</sup>", :inline_format => true, :align => :center

parent_pdf.text "Руководитель Участника торгов", :leading => 4
parent_pdf.text "______________________________________       ________________________________/_____________", :leading => 4

parent_pdf.text "<sup>(должность)#{" "*115}(Ф.И.О.)#{" "*54}(подпись)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50