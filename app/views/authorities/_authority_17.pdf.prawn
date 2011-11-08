parent_pdf.text "Доверенность №____", :align => :center, :style => :bold
parent_pdf.text_field("fname", 298, 774, 20, 16)
parent_pdf.text "г.________________________________________#{" "*37}«__» __________ 20__г."
parent_pdf.text_field("fname1", 10, 760, 240, 16)
parent_pdf.text_field("fname2", 363, 760, 13, 16)
parent_pdf.text_field("fname3", 387, 760, 60, 16)
parent_pdf.text_field("fname4", 460, 760, 13, 16)
parent_pdf.text "Настоящей доверенностью   #{@vars['organization_name']}  ", :leading => 4
parent_pdf.text "<sup>(наименование организации -  Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "______________________________________________________", :leading => 4
parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 60
parent_pdf.text "в лице _______________________________________________________________________________", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "действующего на основании Устава, доверяет #{@vars['agent_position']}, #{@vars['agent_fio']}  ", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 340
parent_pdf.text "паспорт __________, выдан ___________________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "от имени #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 150
parent_pdf.text "осуществлять следующие действия:"

parent_pdf.text " -#{" "*5}участвовать в торгах иностранными валютами на ЕТС, осуществлять операции по покупке и продаже иностранной валюты и заключать сделки в порядке, предусмотренном Правилами проведения операций по покупке и продаже иностранной валюты на Единой торговой сессии (далее – Правила ЕТС);"
parent_pdf.text " -#{" "*5}получать информацию и отчетные документы по результатам торгов иностранными валютами, предусмотренные Правилами ЕТС."
parent_pdf.text "Права и обязанности по сделкам с иностранной валютой, заключенным ", :inline_format => true, :indent_paragraphs => 25
parent_pdf.text "#{@vars['agent_position']}, #{@vars['agent_fio']}  ", :inline_format => true, :indent_paragraphs => 10, :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 40
parent_pdf.text "от имени #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 70
parent_pdf.text "возникают у Участника торгов."

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по"
parent_pdf.text "«__» _____________________________20__г.", :leading => 20

parent_pdf.text "Образец подписи____________________________________________ удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. и подпись сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 170
parent_pdf.text "Контактный телефон доверенного лица:___________________________________________"

parent_pdf.text "__________________________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Должность Руководителя организации)</sup>", :align => :right, :inline_format => true

parent_pdf.text "___________/ ______________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Подпись)</sup>#{" "*10}<sup>(Фамилия И.О.)</sup>", :inline_format => true, :indent_paragraphs => 380
parent_pdf.text " "
parent_pdf.text " "
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => -50