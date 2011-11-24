parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text "\n\n"

parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 736, 120, 15)
parent_pdf.text_field("auth_day", 395, 736, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 736, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 736, 20, 15, :align => 1)

parent_pdf.text_field("name_supplier", 140, 698, 383, 15, :default => @vars['organization_name'])

parent_pdf.text_field("id_supplier", 0, 674, 523, 15)
parent_pdf.text_field("position_supplier", 35, 657, 487, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("deistv", 58, 633, 20, 15)
parent_pdf.text_field("gustav", 148, 633, 85, 15, :default => @vars['document_name'])

#parent_pdf.text_field("position_agent", 237, 633, 285, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent", 0, 616, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_num", 43, 592, 80, 15)

parent_pdf.text_field("passport_date", 160, 592, 363, 15)
parent_pdf.text_field("passport_date2", 0, 568, 523, 15)

parent_pdf.text_field("name_supplier2", 50, 551, 473, 15, :default => @vars['organization_name'])
parent_pdf.text_field("name_supplier3", 0, 527, 523, 15)

#parent_pdf.text_field("position_agent2", 0, 442, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent2", 0, 393, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("name_supplier4", 50, 369, 473, 15, :default => @vars['organization_name'])
parent_pdf.text_field("name_supplier5", 0, 344, 523, 15)

parent_pdf.text_field("auth_create_day", 6, 295, 20, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 295, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 167, 295, 20, 15, :align => 1)

parent_pdf.text_field("name_for_podpis", 90, 261, 360, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("phone_code", 209, 212, 23, 15)
parent_pdf.text_field("phone", 237, 212, 265, 15)

parent_pdf.text_field("position", 367, 149, 157, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 439, 125, 85, 15, :default => @vars['cfs'])


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{"_"*81}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании ______________, доверяет", :leading => 4, :align => :justify
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт #{"_"*13}, выдан #{"_"*60}", :leading => 4
parent_pdf.text "<sup>(кем и когда выдан) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "от имени #{"_"*78}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "осуществлять следующие действия:"

parent_pdf.text " –#{" "*5}участвовать в торгах иностранными валютами на ЕТС, осуществлять операции по покупке и продаже иностранной валюты и заключать сделки в порядке, предусмотренном Правилами проведения операций по покупке и продаже иностранной валюты на Единой торговой сессии (далее Правила ЕТС);", :align => :justify
parent_pdf.text " –#{" "*5}получать информацию и отчетные документы по результатам торгов иностранными валютами, предусмотренные Правилами ЕТС.", :align => :justify

parent_pdf.text "\n", :leading => 4
parent_pdf.text "Права и обязанности по сделкам с иностранной валютой, заключенным", :inline_format => true, :indent_paragraphs => 25
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени #{"_"*79}", :leading => 4
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "возникают у Участника торгов."

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "«___» ____________________ 20___г.", :leading => 20

parent_pdf.text "Образец подписи #{"_"*60} удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. и подпись сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\n\n"

parent_pdf.text "Контактный телефон доверенного лица:(____)____________________________________________"
parent_pdf.text "\n\n\n\n"
parent_pdf.text "__________________________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Должность Руководителя организации)</sup>", :inline_format => true, :indent_paragraphs => 385

parent_pdf.text "___________/ ______________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Подпись)</sup>#{" "*15}<sup>(Фамилия И.О.)</sup>", :inline_format => true, :indent_paragraphs => 380
parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"