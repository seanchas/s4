parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text "\n\n"

parent_pdf.text_field("auth_num", 303, 774, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 736, 120, 15)
parent_pdf.text_field("auth_day", 395, 736, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 736, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 736, 20, 15, :align => 1)

parent_pdf.text_field("organization_name__first", 140, 698, 383, 15, :default => first_string(383, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organization_name__first_to", 0, 674, 523, 15, :default => first_string(383, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("v_lice", 170, 656, 353, 15, :default => first_string(353, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,0))
parent_pdf.text_field("v_lice_to", 0, 633, 523, 15, :default => first_string(353, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,1))

#parent_pdf.text_field("ypolnomachivaet", 275, 616, 248, 15)
parent_pdf.text_field("deistv", 58, 616, 20, 15)
parent_pdf.text_field("gustav", 148, 616, 240, 15, :default => @vars['document_name'])
parent_pdf.text_field("ypolnomachivaet_to", 0, 600, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_num", 43, 559, 80, 15)
parent_pdf.text_field("passport_date", 160, 559, 363, 15)
parent_pdf.text_field("passport_date2", 0, 535, 523, 15)

#parent_pdf.text_field("bank_id", 108, 472, 155, 15)
parent_pdf.text_field("podist_ydostover", 50, 340, 240, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 7, 300, 17, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 300, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 168, 300, 17, 15, :align => 1)

parent_pdf.text_field("phone_code", 167, 165, 23, 15)
parent_pdf.text_field("phone", 196, 165, 265, 15)

#parent_pdf.text_field("treider_email", 190, 347, 300, 15)

parent_pdf.text_field("agent_podpis", 0, 127, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 127, 95, 15, :default => @vars['cfs'])


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "(далее –Участник торгов) в лице  #{"_"*58}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "действующ___ на основании #{"_"*40}, уполномочивает ", :leading => 4, :align => :justify
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "(далее - Трейдер)", :leading => 4
parent_pdf.text "паспорт #{"_"*13}, выдан #{"_"*60}", :leading => 4
parent_pdf.text "<sup>(кем и когда выдан) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "выполнять следующие действия от имени Участника торгов:", :align => :left
parent_pdf.text "объявлять (подавать, изменять, отзывать ранее выставленные) заявки и заключать договоры, являющиеся производными финансовыми инструментами на торгах, организуемых фондовой биржей ОАО Московская биржа в рамках Срочного рынка MICEX, приводящие к открытию позиций на следующих позиционных счетах (выбрать необходимое):", :align => :justify
parent_pdf.text "- всех позиционных счетах", :indent_paragraphs => 30
parent_pdf.text "- №№ позиционных счетов,", :indent_paragraphs => 30
parent_pdf.text "получать и предоставлять документы и осуществлять иные действия, предусмотренные внутренними документами ОАО Московская биржа, устанавливающими требования к организации торговли на Срочном рынке MICEX, от имени  Участника торгов."
parent_pdf.text "\n"

parent_pdf.text "Права и обязанности по сделкам, заключенным на Срочном рынке MICEX  Трейдером от имени Участника торгов принадлежат Участнику торгов."


parent_pdf.text "\n"

parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. Трейдера)</sup>", :inline_format => true, :indent_paragraphs => 85

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :leading => 4
parent_pdf.text "«___» ____________________ 20___г. включительно.", :leading => 20

parent_pdf.text "\n"

parent_pdf.text "Участник торгов подтверждает соответствие Трейдера требованиям, предусмотренным в нормативных правовых актах уполномоченного федерального органа исполнительной власти в отношении аттестации специалистов рынка ценных бумаг, а также внутренними документами ОАО Московская биржа, и несет ответственность за все действия, совершаемые его Трейдером в соответствии с полномочиями, предоставленными настоящей доверенностью, на торгах, организуемых фондовой биржей ОАО Московская биржа в рамках Срочного рынка MICEX.", :align => :justify

parent_pdf.text "\n"
parent_pdf.text "Контактные телефон Трейдера :(____)____________________________________________"
parent_pdf.text "\n"
parent_pdf.text "Руководитель Участника торгов ОАО Московская биржа"
parent_pdf.text "#{"_"*50}#{" "*8}#{"_"*16}/#{"_"*16}", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*65}<sup>(Подпись)</sup>#{" "*20}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"
