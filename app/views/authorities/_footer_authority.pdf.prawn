parent_pdf.text ""
parent_pdf.text "(Идентификатор Участника торгов на фондовом рынке ЗАО «ФБ ММВБ» №___________________)." 
parent_pdf.text "Права и обязанности по сделкам, заключенным  на фондовом рынке ЗАО «ФБ ММВБ»", :indent_paragraphs => 40
parent_pdf.text "  #{@vars['agent_fio']}  ", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени #{@vars['organization_name']}  ", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "принадлежат #{@vars['organization_name']} .", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Подпись ____________________________________#{" "*7}______________ удостоверяем.", :indent_paragraphs => 40, :leading => 1
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)</sup>#{" "*30}<sup>(подпись)</sup>", :inline_format => true, :indent_paragraphs => 140
parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна  по", :indent_paragraphs => 40
parent_pdf.text "«__» _____________ 20   г. включительно."
parent_pdf.text "\n"
parent_pdf.text "Участник торгов подтверждает соответствие   #{@vars['agent_fio']}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "требованиям, предусмотренным нормативными правовыми актами уполномоченного федерального  органа исполнительной власти в отношении аттестации специалистов рынка ценных бумаг, а также внутренними документами ЗАО «ФБ ММВБ», и несет ответственность  за все действия, совершаемые  его Трейдером в ЗАО «ФБ  ММВБ».", :align => :justify
parent_pdf.text "\n"
parent_pdf.text "Контактные телефоны _____________________________\n\n"
parent_pdf.text "Руководитель Участника торгов ЗАО «ФБ ММВБ»" 
parent_pdf.text "_____________________________#{" "*24}_________________/________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*60}<sup>(Подпись)</sup>#{" "*18}<sup>(Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 70
parent_pdf.text "м.п.", :align => :right