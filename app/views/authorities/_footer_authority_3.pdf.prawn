parent_pdf.text_field("phones", 115, 235, 343, 15)

parent_pdf.text_field("auth_create_day", 262, 273, 16, 15)
parent_pdf.text_field("auth_create_month", 285, 273, 60, 15)
parent_pdf.text_field("auth_create_year", 361, 273, 16, 15)

parent_pdf.text "\n\n"

parent_pdf.text_field("agent_fio1", 70, 350, 453, 15, :default => @vars['agent_fio'])
parent_pdf.text "Права и обязанности по сделкам с указанными в настоящей Доверенности Облигациями, заключенным #{"_"*75}", :leading => 4, :indent_paragraphs => 30, :align => :justify


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени Участника, принадлежат Участнику.\n\n"


parent_pdf.text_field("agent_fio1", 78, 301, 240, 15, :default => @vars['agent_fio'])
parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4



parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20___г.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________\n\n", :indent_paragraphs => 30



parent_pdf.text_field("podp", 78, 209, 300, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :indent_paragraphs => 30, :leading => 4



parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П."