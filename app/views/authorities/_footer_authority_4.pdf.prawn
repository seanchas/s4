parent_pdf.text " "
parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным", :leading => 4
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text " "
#parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным #{@vars['agent_fio']}", :align => :justify, :indent_paragraphs => 30, :leading => 4


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени Участника, принадлежат Участнику."

parent_pdf.text "\n"
parent_pdf.text "Подпись #{"_"*62} удостоверяю.",:leading => 4

parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая доверенность действительна по «___»__________ 20___г. включительно.", :leading => 4
parent_pdf.text "<sup>(дата прописью)</sup>",:indent_paragraphs => 40, :inline_format => true, :align => :center
parent_pdf.text "Контактные тел. (____)____________________________________________\n\n", :leading => 4


parent_pdf.text "#{"_"*50}#{" "*8}#{"_"*16}/#{"_"*16}", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

#parent_pdf.text "Подпись #{"_"*50}  ______________/ _______________", :indent_paragraphs => 30, :leading => 4
#parent_pdf.text "Подпись #{@vars['ceo_position']}, #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4


#parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :left
parent_pdf.text "\n"