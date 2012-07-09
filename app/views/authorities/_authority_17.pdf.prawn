## Элементы формы
parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text "\n\n"

parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 736, 120, 15)
parent_pdf.text_field("auth_day", 395, 736, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 736, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 736, 20, 15, :align => 1)

parent_pdf.text_field("name_supplier", 140, 698, 383, 15, :default => first_string(383, @vars['organization_name'],0))

#parent_pdf.text_field("name_supplier2512", 0, 674, 523, 15, :default => first_string(383, @vars['organization_name'],1))
parent_pdf.text_field("id_supplier", 0, 674, 385, 15)

parent_pdf.text_field("position_supplier", 35, 650, 487, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("deistv", 58, 626, 20, 15)
parent_pdf.text_field("gustav", 150, 626, 240, 15, :default => @vars['document_name'])

#parent_pdf.text_field("position_agent", 237, 609, 285, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent", 0, 609, 432, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")


parent_pdf.text_field("passport_serial", 74, 585, 37, 15)
parent_pdf.text_field("passport_num", 130, 585, 60, 15)
parent_pdf.text_field("passport_date", 230, 585, 290, 15)
parent_pdf.text_field("passport_date2", 0, 561, 523, 15)

# Идентификатор Участника
parent_pdf.text_field("id_supplier2", 12, 465, 155, 15)

#parent_pdf.text_field("name_supplier2", 50, 527, 473, 15, :default => first_string(473, @vars['organization_name'],0))
#parent_pdf.text_field("name_supplier3", 0, 503, 523, 15, :default => first_string(473, @vars['organization_name'],1))

#parent_pdf.text_field("position_agent2", 0, 418, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")
parent_pdf.text_field("position_agent2", 47, 442, 218, 15, :default => "#{@vars['agent_fio']}")

#parent_pdf.text_field("name_supplier4", 50, 345, 473, 15, :default => first_string(473, @vars['organization_name'],0))
#parent_pdf.text_field("name_supplier5", 0, 320, 523, 15, :default => first_string(473, @vars['organization_name'],1))

parent_pdf.text_field("auth_create_day", 6, 381, 20, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 381, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 167, 381, 20, 15, :align => 1)

#parent_pdf.text_field("name_for_podpis", 90, 237, 360, 15, :default => "#{@vars['agent_fio']}")

# Контактный телефон
#parent_pdf.text_field("phone_code", 209, 213, 23, 15)
parent_pdf.text_field("phone", 163, 348, 240, 15)

# Адрес электронной почты
parent_pdf.text_field("email", 190, 325, 240, 15)

parent_pdf.text_field("position", 0, 268, 210, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 423, 268, 85, 15, :default => @vars['cfs'])

#### Текст формы
parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
#parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "#{"_"*64}(далее – Участник торгов)", :leading => 4
parent_pdf.text "<sup>(идентификатор Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{"_"*81}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :align => :center
parent_pdf.text "действующ___ на основании #{"_"*40}, уполномочивает", :leading => 4, :align => :justify
parent_pdf.text "#{"_"*72}(далее - Трейдер)", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center


parent_pdf.text "паспорт серии #{"_"*6} № #{"_"*10}, выдан #{"_"*48}", :leading => 4

parent_pdf.text "<sup>(когда, кем) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text "от имени #{"_"*78}", :leading => 4
#parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "осуществлять следующие действия:"

#parent_pdf.text " –#{" "*5}участвовать в торгах иностранными валютами на ЕТС, осуществлять операции по покупке и продаже иностранной валюты и заключать сделки в порядке, предусмотренном Правилами проведения операций по покупке и продаже иностранной валюты на Единой торговой сессии (далее - Правила ЕТС);", :align => :justify
#parent_pdf.text " –#{" "*5}получать информацию и отчетные документы по результатам торгов иностранными валютами, предусмотренные Правилами ЕТС.", :align => :justify
parent_pdf.text "объявлять (подавать, изменять, отзывать ранее поданные) заявки и заключать сделки, получать, предоставлять и подписывать документы и осуществлять иные действия, предусмотренные внутренними документами ОАО Московская Биржа, устанавливающими требования к организации торговли на валютном рынке ОАО Московская Биржа.", :leading => 4, :align => :justify
parent_pdf.text "Идентификатор Участника  торгов  на  валютном  рынке  ОАО  Московская  Биржа", :indent_paragraphs => 30, :align => :justify
parent_pdf.text "№#{"_"*26})", :leading => 10

parent_pdf.text "Подпись #{"_"*36}        #{"_"*14} удостоверяем.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)#{" "*55}(подпись)</sup>", :padding => 10,:inline_format => true, :indent_paragraphs => 100


parent_pdf.text "\n", :leading => 4
#parent_pdf.text "Права и обязанности по сделкам с иностранной валютой, заключенным", :inline_format => true, :indent_paragraphs => 25
#parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "от имени #{"_"*79}", :leading => 4
#parent_pdf.text "<sup>(наименование Участника торгов)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "возникают у Участника торгов."

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "«___» ____________________ 20___г. включительно", :leading => 20

#parent_pdf.text "Образец подписи #{"_"*60} удостоверяю.", :leading => 4
#parent_pdf.text "<sup>(Ф.И.О. и подпись сотрудника)</sup>", :inline_format => true, :align => :center


parent_pdf.text "Контактные телефон Трейдера: #{"_"*40}",:leading => 10
parent_pdf.text "Адрес электронной почты Трейдера: #{"_"*40}" 
parent_pdf.text "\n\n"

parent_pdf.text "Руководитель Участника торгов", :leading => 7
parent_pdf.text "#{"_"*35}#{" "*30}#{"_"*20}/______________/", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>", :inline_format => true, :indent_paragraphs => 70

#parent_pdf.text "", :align => :right, :leading => 4
#parent_pdf.text "<sup>(Подпись)</sup>#{" "*15}<sup>(Фамилия И.О.)</sup>", :inline_format => true, :indent_paragraphs => 380
#parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"



parent_pdf.text "<i>Если лицо, подписавшее данную доверенность, действует на основании доверенности, то дополнительно предоставляется:</i>", :inline_format => true, :size => 10
parent_pdf.text "<i>1. Нотариально заверенная копия доверенности, подтверждающая полномочия лица на подписание доверенности;</i>",:inline_format => true, :size => 10
parent_pdf.text "<i>2. Документ, подтверждающий полномочия лица, выдавшего доверенность, либо его нотариально заверенная копия, либо выписка из него, заверенная подписью уполномоченного лица и скрепленная печатью заявителя.</i>", :inline_format => true, :size => 10,:align => :justify