move = 350
parent_pdf.move_down(move)

parent_pdf.text "<<_____>>_______________  20__ г.\n"
parent_pdf.text "ЗАЯВЛЕНИЕ\n\n", :style => :bold, :align => :center
parent_pdf.text_field("organisation_name", 0, 724-move+14, 515, 15, :default => first_string(523, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organisation_name2", 0, 724-move+14-25, 515, 15, :default => first_string(523, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent32", 0, 665-move+14-18, 515, 15, :default => "#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("birth_year", 0, 643-move+14-18, 45, 15)
parent_pdf.text_field("birth_place", 220, 643-move+14-18, 295, 15)
parent_pdf.text_field("birth_place2", 0, 643-move+14-18-17, 350, 15)
parent_pdf.text_field("grazdanstvo", 429, 643-move+14-18-17, 86, 15)


parent_pdf.text_field("passport_serial", 79, 610-move+12-17, 35, 15)
parent_pdf.text_field("passport_number", 132, 610-move+12-17, 60, 15)
parent_pdf.text_field("passport_vidan", 232, 610-move+12-17, 283, 15)

parent_pdf.text_field("passport_pole", 0, 585-move+13-17, 515, 15)
parent_pdf.text_field("passport_pole2", 0, 555-move+10-17, 515, 15)
parent_pdf.text_field("passport_pole3", 0, 523-move+7-17, 515, 15, :default => "#{@vars['agent_document']}")

parent_pdf.text_field("auth_create_day", 16, 423, 25, 15)
parent_pdf.text_field("auth_create_month", 60, 423, 80, 15)
parent_pdf.text_field("auth_create_year", 165, 423, 15, 15)

parent_pdf.text "______________________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов )</sup>", :inline_format => true, :align => :center

parent_pdf.text "______________________________________________________________________________________", :leading => 4

parent_pdf.text "(далее – участник торгов) просит аккредитовать в качестве трейдера на Срочном рынке FORTS в качестве трейдера без права подачи заявок<sup>1</sup> #{"_"*86},", :leading => 4, :inline_format => true

parent_pdf.text "<sup>(Фамилия, Имя, Отчество)</sup>", :inline_format => true, :align => :center
parent_pdf.text "________ года рождения, место рождения __________________________________________________", :leading => 4
parent_pdf.text "___________________________________________________________, гражданство _______________,", :leading => 4

parent_pdf.text "паспорт<sup>2</sup> серия ______ № __________, выдан _______________________________________________,", :leading => 4, :inline_format => true
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*86}", :leading => 4
parent_pdf.text "\n______________________________________________________________________________________", :leading => 2
parent_pdf.text "<sup>(сведения (адрес) о регистрации по месту жительства)</sup>", :inline_format => true, :align => :center



parent_pdf.text "Данные квалификационного аттестата/лицензии биржевого брокера
______________________________________________________________________________________", :align => :justify

parent_pdf.text "С правом выполнять следующие действия от имени участника торгов:", :align => :justify
parent_pdf.text "объявлять (подавать, изменять, отзывать ранее поданные) заявки и заключать договоры, являющиеся производными финансовыми инструментами, на торгах, организуемых ОАО Московская Биржа (далее – Биржа), получать, предоставлять и подписывать документы и осуществлять иные действия, _____________________", :align => :justify, :leading => 4

parent_pdf.text "<sup>1</sup>  Используется только при аккредитации трейдера на Товарном рынке
<sup>2</sup>  Если нет паспорта, то данные миграционной карты: серия, номер карты, дата начала срока пребывания и дата окончания срока пребывания или данные документа, подтверждающего право иностранного гражданина или лица без гражданства на пребывание (проживание) в Российской Федерации: серия (если имеется) и номер документа, дата начала срока действия права пребывания (проживания), дата окончания срока действия права пребывания (проживания);
", :align => :justify, :leading => 4, :size => 10, :inline_format => true

parent_pdf.text "предусмотренные внутренними документами Биржи, устанавливающими требования к организации торговли.", :align => :justify, :leading => 4
parent_pdf.text "Контактный телефон трейдера____________________________________________________", :align => :justify, :leading => 4
parent_pdf.text "Адрес электронной почты трейдера________________________________________________", :align => :justify, :leading => 4



parent_pdf.text "\n\nРуководитель участника торгов \n _____________________________________      ____________________________     _____________", :leading => 4

parent_pdf.text "<sup>(должность)#{" "*105}(Ф.И.О.)#{" "*62}(подпись)</sup>", :inline_format => true, :align => :left, :indent_paragraphs => 95
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => 50

parent_pdf.go_to_page 2
parent_pdf.text_field("phone", 160, 742, 309, 15)
parent_pdf.text_field("email", 185, 725, 285, 15)

parent_pdf.text_field("position_agent212", 0, 658, 223, 15, :default => "#{@vars['ceo_position']}")
parent_pdf.text_field("position_agent212a", 238, 658, 169, 15, :default => "#{@vars['ceo_fio']}")