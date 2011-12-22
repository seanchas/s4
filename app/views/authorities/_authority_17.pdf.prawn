parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text "\n\n"

parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 736, 120, 15)
parent_pdf.text_field("auth_day", 395, 736, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 736, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 736, 20, 15, :align => 1)

parent_pdf.text_field("name_supplier", 140, 698, 383, 15, :default => first_string(383, @vars['organization_name'],0))

parent_pdf.text_field("name_supplier2512", 0, 674, 523, 15, :default => first_string(383, @vars['organization_name'],1))
parent_pdf.text_field("id_supplier", 0, 657, 523, 15)

parent_pdf.text_field("position_supplier", 35, 633, 487, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("deistv", 58, 609, 20, 15)
parent_pdf.text_field("gustav", 150, 609, 240, 15, :default => @vars['document_name'])

#parent_pdf.text_field("position_agent", 237, 609, 285, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent", 0, 592, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")


parent_pdf.text_field("passport_serial", 74, 568, 37, 15)
parent_pdf.text_field("passport_num", 130, 568, 60, 15)
parent_pdf.text_field("passport_date", 230, 568, 290, 15)
parent_pdf.text_field("passport_date2", 0, 544, 523, 15)

parent_pdf.text_field("name_supplier2", 50, 527, 473, 15, :default => first_string(473, @vars['organization_name'],0))
parent_pdf.text_field("name_supplier3", 0, 503, 523, 15, :default => first_string(473, @vars['organization_name'],1))

#parent_pdf.text_field("position_agent2", 0, 418, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent2", 0, 369, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("name_supplier4", 50, 345, 473, 15, :default => @vars['organization_name'])
parent_pdf.text_field("name_supplier5", 0, 320, 523, 15)

parent_pdf.text_field("auth_create_day", 6, 271, 20, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 271, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 167, 271, 20, 15, :align => 1)

parent_pdf.text_field("name_for_podpis", 90, 237, 360, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("phone_code", 209, 213, 23, 15)
parent_pdf.text_field("phone", 237, 213, 265, 15)

parent_pdf.text_field("position", 225, 175, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 439, 151, 85, 15, :default => @vars['cfs'])


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{"_"*81}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*40}, доверяет", :leading => 4, :align => :justify
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center


parent_pdf.text "паспорт серия #{"_"*6} № #{"_"*10}, выдан #{"_"*48}", :leading => 4

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


parent_pdf.text "Контактный телефон доверенного лица:(____)____________________________________________"
parent_pdf.text "\n\n"
parent_pdf.text "#{"_"*50}", :align => :right, :leading => 4
parent_pdf.text "<sup>(Должность Руководителя организации)</sup>", :inline_format => true, :indent_paragraphs => 385

parent_pdf.text "___________/ ______________", :align => :right, :leading => 4
parent_pdf.text "<sup>(Подпись)</sup>#{" "*15}<sup>(Фамилия И.О.)</sup>", :inline_format => true, :indent_paragraphs => 380
parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"

parent_pdf.text "Примечание:", :size => 10
parent_pdf.text "Если лицо, подписавшее данную доверенность, действует на основании доверенности, то дополнительно предоставляется:", :size => 10
parent_pdf.text "1.	Нотариально заверенная копия доверенности, подтверждающая полномочия лица на подписание доверенности;", :size => 10
parent_pdf.text "2.	Документ, подтверждающий полномочия лица, выдавшего доверенность, либо его нотариально заверенная копия,  либо выписка из него, заверенная подписью уполномоченного лица и скрепленная печатью доверителя.", :size => 10