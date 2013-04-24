
#parent_pdf.text " "
parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным", :leading => 4

parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "от имени Участника, принадлежат Участнику.", :leading => 6


parent_pdf.text "Подпись #{"_"*67} удостоверяю.", :leading => 4


parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20___г. включительно."
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. ________________________________________________\n\n"


parent_pdf.text "Подпись #{"_"*78}_", :leading => 4
parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100, :leading => 20


parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :left, :indent_paragraphs => 50


parent_pdf.go_to_page 2
parent_pdf.text_field("phone_code", 88, 736, 22, 15)
parent_pdf.text_field("phone", 116, 736, 265, 15)

parent_pdf.text_field("agent_podpis", 50, 711, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 400, 711, 95, 15, :default => @vars['cfs'])


parent_pdf.text_field("auth_create_day", 232, 773, 17, 15)
parent_pdf.text_field("auth_create_month", 257, 773, 60, 15)
parent_pdf.text_field("auth_create_year", 331, 773, 17, 15)