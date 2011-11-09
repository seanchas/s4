parent_pdf.text "\n\n"
parent_pdf.text "Права и обязанности по сделкам с указанными в настоящей Доверенности Облигациями, заключенным #{@vars['agent_fio']}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени Участника, принадлежат Участнику."
parent_pdf.text "Подпись #{@vars['agent_fio']} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20__г.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________\n\n", :indent_paragraphs => 30
parent_pdf.text "Подпись #{@vars['ceo_position']}, #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П."