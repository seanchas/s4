parent_pdf.text_field("phones", 115, 266, 343, 19)

parent_pdf.text_field("auth_create_day", 262, 305, 17, 19)
parent_pdf.text_field("auth_create_month", 285, 305, 60, 19)
parent_pdf.text_field("auth_create_year", 360, 305, 12, 19)

parent_pdf.text "\n\n"
parent_pdf.text "Права и обязанности по сделкам с указанными в настоящей Доверенности Облигациями, заключенным #{@vars['agent_fio']}", :leading => 4, :indent_paragraphs => 30, :align => :justify


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени Участника, принадлежат Участнику."


parent_pdf.text_field("agent_fio1", 78, 330, 237, 15, :default => @vars['agent_fio'])
parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4



parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20__г.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________\n\n", :indent_paragraphs => 30



parent_pdf.text_field("podp", 78, 239, 200, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :indent_paragraphs => 30, :leading => 4



parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П."