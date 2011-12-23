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

parent_pdf.text_field("v_lice", 170, 656, 353, 15, :default => first_string(383, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,0))
parent_pdf.text_field("v_lice_to", 0, 633, 523, 15, :default => first_string(383, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,1))

#parent_pdf.text_field("ypolnomachivaet", 275, 616, 248, 15)
parent_pdf.text_field("deistv", 58, 616, 20, 15)
parent_pdf.text_field("gustav", 148, 616, 240, 15, :default => @vars['document_name'])
parent_pdf.text_field("ypolnomachivaet_to", 0, 600, 423, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_num", 43, 576, 80, 15)
parent_pdf.text_field("passport_date", 160, 576, 363, 15)
parent_pdf.text_field("passport_date2", 0, 552, 523, 15)


parent_pdf.text_field("bank_id", 108, 472, 155, 15)

parent_pdf.text_field("podist_ydostover", 50, 459, 240, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 7, 418, 17, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 418, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 168, 418, 17, 15, :align => 1)

parent_pdf.text_field("phone_code", 167, 373, 23, 15)
parent_pdf.text_field("phone", 196, 373, 265, 15)

parent_pdf.text_field("treider_email", 190, 347, 300, 15)

parent_pdf.text_field("agent_podpis", 0, 310, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 310, 95, 15, :default => @vars['cfs'])


parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{"_"*63}", :leading => 4, :align => :justify
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "(далее –Участник торгов) в лице  #{"_"*58}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>",  :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "действующ___ на основании #{"_"*40}, уполномочивает ", :leading => 4, :align => :justify
parent_pdf.text "#{"_"*71} (далее - Трейдер)", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт #{"_"*13}, выдан #{"_"*60}", :leading => 4
parent_pdf.text "<sup>(кем и когда выдан) </sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "объявлять (подавать, изменять, отзывать ранее поданные) заявки и заключать сделки, получать, предоставлять и подписывать документы и осуществлять иные действия, предусмотренные внутренними документами ЗАО «ФБ ММВБ», устанавливающими требования к организации торговли на фондовом рынке ЗАО «ФБ ММВБ». ", :align => :justify
parent_pdf.text "(Идентификатор Участника торгов на фондовом рынке ЗАО «ФБ ММВБ» (для Сектора рынка Основной рынок)  №__________________________)"


parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)#{" "*80}(Подпись)</sup>", :inline_format => true, :indent_paragraphs => 85

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :leading => 4
parent_pdf.text "«___» ____________________ 20___г. включительно.", :leading => 20

parent_pdf.text "\n"


parent_pdf.text "Контактные телефон Трейдера :(____)____________________________________________"
parent_pdf.text "\n"
parent_pdf.text "Адрес электронной почты Трейдера :_________________________________________________"
parent_pdf.text "\n"
parent_pdf.text "Руководитель Участника торгов ЗАО «ФБ ММВБ»"
parent_pdf.text "#{"_"*50}#{" "*8}#{"_"*16}/#{"_"*16}", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*65}<sup>(Подпись)</sup>#{" "*20}<sup>(Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 130

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"

parent_pdf.text "Примечание:", :size => 10
parent_pdf.text "Если лицо, подписавшее данную доверенность, действует на основании доверенности, то дополнительно предоставляется:", :size => 10
parent_pdf.text "1.Нотариально заверенная копия доверенности, подтверждающая полномочия лица на подписание доверенности;", :size => 10
parent_pdf.text "2.Документ, подтверждающий полномочия лица, выдавшего доверенность, либо его нотариально заверенная копия,  либо выписка из него, заверенная подписью уполномоченного лица и скрепленная печатью доверителя.", :size => 10
