parent_pdf.text " "
parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным   #{@vars['agent_fio']}  ", :leading => 4
parent_pdf.text "#{" "*20}<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "от имени Участника, принадлежат Участнику.", :leading => 10
parent_pdf.text "#{" "*5}Подпись #{@vars['agent_fio']}   _____________________удостоверяю.", :leading => 4
parent_pdf.text "#{" "*45}<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :indent_paragraphs => 85
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20__г."
parent_pdf.text " "
parent_pdf.text " "
parent_pdf.text "Контактные тел. _________________________________________________________"
parent_pdf.text "#{" "*5}Подпись   #{@vars['ceo_position']}, #{@vars['ceo_fio']}   ___________/ ___________", :leading => 4
parent_pdf.text "#{" "*45}<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 10, :leading => 20
parent_pdf.text "М.П."