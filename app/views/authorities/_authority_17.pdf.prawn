parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold

parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 761, 120, 15)
parent_pdf.text_field("auth_day", 395, 761, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 761, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 761, 20, 15, :align => 1)

parent_pdf.text_field("id_supplier", 0, 700, 523, 15)
parent_pdf.text_field("name_supplier", 140, 723, 383, 15, :default => @vars['organization_name'])
parent_pdf.text_field("position_supplier", 35, 675, 487, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")

#parent_pdf.text_field("position_agent", 237, 651, 285, 15, :default => "#{@vars['agent_position']}, #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent", 237, 651, 285, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("passport_num", 43, 627, 80, 15)

parent_pdf.text_field("passport_date", 160, 627, 363, 15)
parent_pdf.text_field("passport_date2", 0, 603, 523, 15)

parent_pdf.text_field("name_supplier2", 50, 586, 473, 15, :default => @vars['organization_name'])

#parent_pdf.text_field("position_agent2", 0, 460, 523, 15, :default => "#{@vars['agent_position']}, #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent2", 0, 460, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("name_supplier3", 50, 436, 473, 15, :default => @vars['organization_name'])

parent_pdf.text_field("auth_create_day", 6, 379, 20, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 379, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 167, 379, 20, 15, :align => 1)

parent_pdf.text_field("telephones", 205, 297, 300, 15)
parent_pdf.text_field("position", 366, 235, 160, 15, :align => 1)


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{"_"*81}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "действующего на основании Устава, доверяет #{"_"*47}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 340
parent_pdf.text "паспорт #{"_"*13}, выдан #{"_"*60}", :leading => 4
parent_pdf.text "<sup>(кем и когда выдан) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "от имени #{"_"*78}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 150
parent_pdf.text "осуществлять следующие действия:"

parent_pdf.text " –#{" "*5}участвовать в торгах иностранными валютами на ЕТС, осуществлять операции по покупке и продаже иностранной валюты и заключать сделки в порядке, предусмотренном Правилами проведения операций по покупке и продаже иностранной валюты на Единой торговой сессии (далее Правила ЕТС);", :align => :justify
parent_pdf.text " –#{" "*5}получать информацию и отчетные документы по результатам торгов иностранными валютами, предусмотренные Правилами ЕТС.", :align => :justify
parent_pdf.text "Права и обязанности по сделкам с иностранной валютой, заключенным", :inline_format => true, :indent_paragraphs => 25
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени #{"_"*79}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :align => :center
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