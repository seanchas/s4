#parent_pdf.text_field("phones", 163, 311, 315, 15)

parent_pdf.text_field("podpiska", 46, 412, 220, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("auth_create_day", 22, 349, 16, 15)
parent_pdf.text_field("auth_create_month", 48, 349, 80, 15)
parent_pdf.text_field("auth_create_year", 142, 349, 16, 15)

parent_pdf.text_field("phone_code", 168, 311, 23, 15)
parent_pdf.text_field("phone", 198, 311, 265, 15)
parent_pdf.text_field("phones_traider", 190, 286, 285, 15)


parent_pdf.text "Подпись ____________________________________#{" "*7}______________ удостоверяю."
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)</sup>#{" "*30}<sup>(подпись)</sup>", :inline_format => true, :indent_paragraphs => 90

parent_pdf.text "\n\n"

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна"
parent_pdf.text "по «___» _____________ 20___г."

parent_pdf.text "\n\n"

parent_pdf.text "Контактный телефон Трейдера: (____)____________________________________________"

parent_pdf.text "\n"

parent_pdf.text "Адрес электронной почты Трейдера: _______________________________________________"

parent_pdf.text "\n\n"

parent_pdf.text "Руководитель Участника торгов"

parent_pdf.text_field("agent_podpis", 0, 235, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 235, 95, 15, :default => @vars['cfs'])


parent_pdf.text "#{"_"*50}#{" "*17} ___________/ ________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130


#parent_pdf.text_field("dolzh", 0, 235, 175, 15, :default => "#{@vars['agent_position']}")
#parent_pdf.text "_____________________________#{" "*40}_________________ ________________", :leading => 4
#parent_pdf.text "<sup>(Должность)</sup>#{" "*80}<sup>(Ф.И.О.)</sup>#{" "*18}<sup>(Подпись)</sup>", :inline_format => true, :indent_paragraphs => 70

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"