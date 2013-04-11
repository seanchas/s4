parent_pdf.move_down(350)

parent_pdf.text "ДОВЕРЕННОСТЬ №______", :align => :center, :style => :bold
parent_pdf.text "\n\n"

parent_pdf.text_field("auth_num", 303, 424, 35, 15)
parent_pdf.text "г. ____________________#{" "*87}«___» __________ 20___г."
parent_pdf.text_field("year", 10, 386, 120, 15)
parent_pdf.text_field("auth_day", 395, 386, 20, 15, :align => 1)
parent_pdf.text_field("auth_month", 425, 386, 60, 15, :align => 1)
parent_pdf.text_field("auth_year", 497, 386, 20, 15, :align => 1)

parent_pdf.text_field("organization_name__first", 140, 348, 383, 15, :default => first_string(383, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("organization_name__first_to", 0, 324, 523, 15, :default => first_string(383, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("v_lice", 170, 306, 353, 15, :default => first_string(353, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,0))
parent_pdf.text_field("v_lice_to", 0, 283, 523, 15, :default => first_string(353, "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}" ,1))

#parent_pdf.text_field("ypolnomachivaet", 275, 266, 248, 15)
parent_pdf.text_field("deistv", 58, 266, 20, 15)
parent_pdf.text_field("gustav", 148, 266, 240, 15, :default => @vars['document_name'])
parent_pdf.text_field("ypolnomachivaet_to", 0, 250-2, 423, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_num", 43, 226, 80, 15)
parent_pdf.text_field("passport_date", 160, 226, 363, 15)
parent_pdf.text_field("passport_date2", 0, 202, 523, 15)


parent_pdf.text_field("bank_id", 12, 122-5, 155, 15)

parent_pdf.text_field("podist_ydostover", 50, 108-7, 240, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 7, 68-7, 17, 15, :align => 1)
parent_pdf.text_field("auth_create_month", 33, 68-7, 122, 15, :align => 1)
parent_pdf.text_field("auth_create_year", 168, 68-7, 17, 15, :align => 1)

parent_pdf.text_field("phone_code", 167, 23+5, 23, 15)
parent_pdf.text_field("phone", 196, 23+5, 265, 15)


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

parent_pdf.text "объявлять (подавать, изменять, отзывать ранее поданные) заявки и заключать сделки, получать, предоставлять и подписывать документы и осуществлять иные действия, предусмотренные внутренними документами ЗАО «ФБ ММВБ», устанавливающими требования к организации торговли в ЗАО «ФБ ММВБ». ", :align => :justify
parent_pdf.text "(Идентификатор Участника торгов ЗАО «ФБ ММВБ» (для Сектора рынка Основной рынок)  №__________________________)", :leading => 4


parent_pdf.text "Подпись  #{"_"*40} _____________________ удостоверяю.", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. представителя Участника торгов)#{" "*80}(Подпись)</sup>", :inline_format => true, :indent_paragraphs => 85

parent_pdf.text "Настоящая доверенность выдана без права передоверия и действительна по", :leading => 4
parent_pdf.text "«___» ____________________ 20___г. включительно.", :leading => 20

#parent_pdf.text "\n"


parent_pdf.text "Контактный телефон Трейдера :(____)____________________________________________"
parent_pdf.text "\n"
parent_pdf.text "Адрес электронной почты Трейдера :_________________________________________________"
parent_pdf.text "\n"
parent_pdf.text "Руководитель Участника торгов ЗАО «ФБ ММВБ»"
parent_pdf.text "#{"_"*50}#{" "*8}#{"_"*16}/#{"_"*16}", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*65}<sup>(Подпись)</sup>#{" "*20}<sup>(Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 130

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50
parent_pdf.text "\n"
#
#parent_pdf.text "Примечание:", :size => 10
#parent_pdf.text "Если лицо, подписавшее данную доверенность, действует на основании доверенности, то дополнительно предоставляется:", :size => 10
#parent_pdf.text "1.Нотариально заверенная копия доверенности, подтверждающая полномочия лица на подписание доверенности;", :size => 10
#parent_pdf.text "2.Документ, подтверждающий полномочия лица, выдавшего доверенность, либо его нотариально заверенная копия,  либо выписка из него, заверенная подписью уполномоченного лица и скрепленная печатью доверителя.", :size => 10
#
#

parent_pdf.go_to_page 2
parent_pdf.text_field("treider_email", 190, 760, 300, 15)

parent_pdf.text_field("agent_podpis", 0, 722, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 722, 95, 15, :default => @vars['cfs'])