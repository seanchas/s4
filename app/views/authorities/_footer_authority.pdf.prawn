parent_pdf.text_field("phones", 163, 311, 315, 15)
parent_pdf.text_field("phones_traider", 190, 286, 285, 15)

parent_pdf.text_field("auth_create_day", 20, 349, 13, 15)
parent_pdf.text_field("auth_create_month", 41, 349, 80, 15)
parent_pdf.text_field("auth_create_year", 135, 349, 13, 15)

parent_pdf.text_field("dolzh", 0, 235, 175, 15)

parent_pdf.text "Подпись ____________________________________#{" "*7}______________ удостоверяем."
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)</sup>#{" "*20}<sup>(подпись)</sup>", :inline_format => true, :indent_paragraphs => 140

parent_pdf.text "\n\n"

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна"
parent_pdf.text "по «__» _____________ 20__г."

parent_pdf.text "\n\n"

parent_pdf.text "Контактный телефон Трейдера: ____________________________________________________"

parent_pdf.text "\n"

parent_pdf.text "Адрес электронной почты Трейдера: _______________________________________________"

parent_pdf.text "\n\n"

parent_pdf.text "Руководитель Участника торгов"
parent_pdf.text "_____________________________#{" "*40}_________________ ________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*80}<sup>(Ф.И.О.)</sup>#{" "*18}<sup>(Подпись)</sup>", :inline_format => true, :indent_paragraphs => 70
parent_pdf.text "м.п.", :align => :right