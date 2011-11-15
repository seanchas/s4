parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 776, 35, 19)
parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 763, 120, 19)
parent_pdf.text_field("auth_day", 397, 763, 20, 19)
parent_pdf.text_field("auth_month", 425, 763, 60, 19)
parent_pdf.text_field("auth_year", 497, 763, 20, 19)

parent_pdf.text_field("id_supplier", 0, 701, 523, 19)

parent_pdf.text_field("passport_num", 43, 629, 80, 19)
parent_pdf.text_field("passport_date", 160, 629, 363, 19)
parent_pdf.text_field("passport_date2", 0, 605, 523, 19)

parent_pdf.text_field("auth_create_day", 7, 381, 20, 19)
parent_pdf.text_field("auth_create_month", 33, 381, 125, 19)
parent_pdf.text_field("auth_create_year", 167, 381, 20, 19)

parent_pdf.text_field("telephones", 205, 300, 300, 19)
parent_pdf.text_field("position", 366, 236, 180, 19)


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "действующего на основании Устава, доверяет #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 340
parent_pdf.text "паспорт #{"_"*13}, выдан #{"_"*60}", :leading => 4
parent_pdf.text "<sup>(кем и когда выдан) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "от имени #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 150
parent_pdf.text "осуществлять следующие действия:"

parent_pdf.text " –#{" "*5}участвовать в торгах иностранными валютами на ЕТС, осуществлять операции по покупке и продаже иностранной валюты и заключать сделки в порядке, предусмотренном Правилами проведения операций по покупке и продаже иностранной валюты на Единой торговой сессии (далее – Правила ЕТС);", :align => :justify
parent_pdf.text " –#{" "*5}получать информацию и отчетные документы по результатам торгов иностранными валютами, предусмотренные Правилами ЕТС.", :align => :justify
parent_pdf.text "Права и обязанности по сделкам с иностранной валютой, заключенным", :inline_format => true, :indent_paragraphs => 25
parent_pdf.text "#{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 40
parent_pdf.text "от имени #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 70
parent_pdf.text "возникают у Участника торгов."

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "«___» ____________________ 20___г.", :leading => 20

parent_pdf.text "Образец подписи____________________________________________ удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. и подпись сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 170
parent_pdf.text "\n\n"
parent_pdf.text "Контактный телефон доверенного лица:_________________________________________________"
parent_pdf.text "\n\n\n\n"
parent_pdf.text "__________________________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Должность Руководителя организации)</sup>", :align => :right, :inline_format => true

parent_pdf.text "___________/ ______________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Подпись)</sup>#{" "*10}<sup>(Фамилия И.О.)</sup>", :inline_format => true, :indent_paragraphs => 380
parent_pdf.text "\n\n"
parent_pdf.text "М.П.#{" "*20}", :align => :right, :indent_paragraphs => -50