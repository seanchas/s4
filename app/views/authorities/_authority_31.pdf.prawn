move = 350
parent_pdf.move_down(move)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :style => :bold, :align => :center
parent_pdf.text_field("auth_num", 303, 774-move, 35, 15)

parent_pdf.text "г.____________________                                                                               \"____\"______________20___г.\n\n"
parent_pdf.text_field("year", 8, 750-move, 118, 15)

parent_pdf.text_field("position_agent2", 0, 724-move, 523, 15, :default => first_string(378, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent22", 0, 724-move-24, 523, 15, :default => first_string(378, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent212", 37, 699-move-32, 486, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("ya",58, 675-move-32, 13, 15)
parent_pdf.text_field("gustav", 145, 675-move-32, 240, 15, :default => @vars['document_name'])

#first place

parent_pdf.text_field("position_agent2234", 20, 275-17, 503, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 252-17, 40, 15)
parent_pdf.text_field("passport_num", 129, 252-17, 60, 15)
parent_pdf.text_field("passport_date", 230, 252-17, 293, 15)
parent_pdf.text_field("passport_date2", 0, 228-17, 523, 15)

parent_pdf.text_field("position_agent2244", 95, 197-17, 370, 15, :default => @vars['agent_fio'])

#second place

parent_pdf.text_field("position_agent21a", 20, 162-4, 503, 15)

parent_pdf.text_field("passport_ser2a", 74, 136-2, 40, 15)
parent_pdf.text_field("passport_num2a", 129, 136-2, 60, 15)
parent_pdf.text_field("passport_date2a", 230, 136-2, 293, 15)
parent_pdf.text_field("passport_date22a", 0, 113-2-3, 523, 15)

parent_pdf.text_field("position_agent22a", 95, 83-6, 370, 15)
#second end

parent_pdf.text_field("auth_create_day", 369, 400, 23, 15)
parent_pdf.text_field("auth_create_month", 403, 400, 60, 15)
parent_pdf.text_field("auth_create_year", 496, 400, 17, 15)

parent_pdf.text "_______________________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов )</sup>", :inline_format => true, :align => :center

parent_pdf.text "_______________________________________________________________________________________", :leading => 4

parent_pdf.text "\nв лице #{"_"*80},", :leading => 4

parent_pdf.text "<sup>(должность, Фамилия, Имя, Отчество)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ__ на основании #{"_"*40} \nуполномачивает:", :leading => 4

parent_pdf.text "1. #{"_"*85}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*85}", :leading => 4
parent_pdf.text "\nОбразец подписи__________________________________________________________________", :leading => 2
parent_pdf.text "<sup>(Фамилия, Имя, Отчество и подпись Представителя)</sup>", :inline_format => true, :align => :center

parent_pdf.text "2. #{"_"*85}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "\nОбразец подписи__________________________________________________________________", :leading => 2
parent_pdf.text "<sup>(Фамилия, Имя, Отчество и подпись Представителя)</sup>", :inline_format => true, :align => :center

parent_pdf.text "предоставлять и получать документы (включая отчетные документы) в Закрытом акционерном обществе «Фондовая бирже ММВБ» (далее - ЗАО «ФБ ММВБ»),  оформляемые  в соответствии с внутренними документами ЗАО «ФБ ММВБ», регламентирующими проведение операций, связанных с заключением сделок в ЗАО «ФБ ММВБ».
                 Подпись(и) вышеуказанного(ых) уполномоченного(ых) лиц(а) удостоверяю.
                 Настоящая доверенность выдана без права передоверия и действительна по  «___»__________ 20__г. включительно.
                 Контактный телефон: _______________________", :align => :justify

parent_pdf.text "\n\n"

parent_pdf.text "Подпись #{"_"*62}.", :leading => 4

parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :left, :indent_paragraphs => 50



parent_pdf.go_to_page 2
parent_pdf.text_field("as", 404, 761, 19, 15)
parent_pdf.text_field("sd", 435, 761, 50, 15)
parent_pdf.text_field("xc", 506, 761, 12, 15)

parent_pdf.text_field("rt", 51, 700, 370, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
parent_pdf.text_field("yu", 120, 735, 125, 15)