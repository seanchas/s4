parent_pdf.text " "
parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным", :leading => 4
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text " "
#parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным #{@vars['agent_fio']}", :align => :justify, :indent_paragraphs => 30, :leading => 4


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "от имени Участника, принадлежат Участнику."


parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4
#parent_pdf.text "Подпись #{@vars['agent_fio']} _____________________удостоверяю.", :leading => 4, :indent_paragraphs => 30


parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :indent_paragraphs => 85
parent_pdf.text "Настоящая доверенность действительна по «___»__________ 20___г. включительно.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________\n\n", :indent_paragraphs => 30


parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :indent_paragraphs => 30, :leading => 4
#parent_pdf.text "Подпись #{@vars['ceo_position']}, #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4


parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100, :leading => 20
parent_pdf.text "М.П."