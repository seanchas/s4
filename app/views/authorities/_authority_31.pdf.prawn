move = 350
parent_pdf.move_down(move)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :style => :bold, :align => :center
parent_pdf.text_field("auth_num", 303, 774-move, 35, 15)

parent_pdf.text "г.____________________                                                                               \"____\"______________20___г.\n\n"
parent_pdf.text_field("year", 8, 750-move, 118, 15)

parent_pdf.text_field("position_agent2", 0, 724-move, 523, 15, :default => first_string(523, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent22", 0, 724-move-24, 523, 15, :default => first_string(523, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent212", 39, 699-move-32, 484, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("ya",58, 675-move-32, 24, 15)
parent_pdf.text_field("gustav", 157, 675-move-32, 240, 15, :default => @vars['document_name'])

#first place

parent_pdf.text_field("position_agent2234", 20, 275-21-3, 503, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 252-21-4, 40, 15)
parent_pdf.text_field("passport_num", 132, 252-21-4, 60, 15)
parent_pdf.text_field("passport_date", 233, 252-21-4, 290, 15)
parent_pdf.text_field("passport_date2", 0, 228-22-3, 523, 15)

parent_pdf.text_field("position_agent2244", 95, 197-22-3, 428, 15, :default => @vars['agent_fio'])

#second place

parent_pdf.text_field("position_agent21a", 20, 162-4-5-3, 503, 15)

parent_pdf.text_field("passport_ser2a", 74, 136-2-5-3, 40, 15)
parent_pdf.text_field("passport_num2a", 132, 136-2-5-3, 60, 15)
parent_pdf.text_field("passport_date2a", 233, 136-2-5-3, 290, 15)
parent_pdf.text_field("passport_date22a", 0, 113-2-3-3-3, 523, 15)

parent_pdf.text_field("position_agent22a", 95, 83-6-3-4, 428, 15)
#second end

parent_pdf.text_field("auth_create_day", 369, 400, 23, 15)
parent_pdf.text_field("auth_create_month", 403, 400, 60, 15)
parent_pdf.text_field("auth_create_year", 494, 400, 17, 15)

parent_pdf.text "_______________________________________________________________________________________", :leading => 4

parent_pdf.text "<sup>(наименование организации - Участника торгов )</sup>", :inline_format => true, :align => :center

parent_pdf.text "_______________________________________________________________________________________", :leading => 4

parent_pdf.text "\nв лице  #{"_"*80},", :leading => 4, :align => :right

parent_pdf.text "<sup>(должность, Фамилия, Имя, Отчество)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ____ на основании #{"_"*40}", :leading => 4
parent_pdf.text "<sup>(наименование документа и его реквизиты)</sup>", :inline_format => true, :align => :center
parent_pdf.text "уполномачивает:", :leading => 4

parent_pdf.text "1. #{"_"*85}", :leading => 4, :align => :right


parent_pdf.text "<sup>(Фамилия, Имя, Отчество Представителя)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______  № __________, выдан ________________________________________________,", :leading => 4, :align => :right
parent_pdf.text "<sup>(кем и когда выдан)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*87}", :leading => 4, :align => :right
parent_pdf.text "\nОбразец подписи  _______________________________________________________________________", :leading => 2, :align => :right
parent_pdf.text "<sup>(Фамилия, Имя, Отчество и подпись Представителя)</sup>", :inline_format => true, :align => :center

parent_pdf.text "2. #{"_"*85}", :leading => 4, :align => :right


parent_pdf.text "<sup>(Фамилия, Имя, Отчество Представителя)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______  № __________, выдан ________________________________________________,", :leading => 4, :align => :right
parent_pdf.text "<sup>(кем и когда выдан)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*87}", :leading => 4, :align => :right
parent_pdf.text "\nОбразец подписи  _______________________________________________________________________", :leading => 4, :align => :right
parent_pdf.text "<sup>(Фамилия, Имя, Отчество и подпись Представителя)</sup>", :inline_format => true, :align => :center

parent_pdf.text "предоставлять и получать документы (включая отчетные документы) в Закрытом акционерном обществе «Фондовая бирже ММВБ» (далее - ЗАО «ФБ ММВБ»),  оформляемые  в соответствии с внутренними документами ЗАО «ФБ ММВБ», регламентирующими проведение операций, связанных с заключением сделок в ЗАО «ФБ ММВБ».
                 Подпись(и) вышеуказанного(ых) уполномоченного(ых) лиц(а) удостоверяю.
                 Настоящая доверенность выдана без права передоверия и действительна по  «___»__________ 20___г. включительно.
                 Контактный телефон: _______________________", :align => :justify

parent_pdf.text "\n\n"

parent_pdf.text "Подпись #{"_"*78}.", :leading => 4

parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :left, :indent_paragraphs => 50



parent_pdf.go_to_page 2
parent_pdf.text_field("as", 400, 761-12, 16, 15)
parent_pdf.text_field("sd", 430, 761-12, 50, 15)
parent_pdf.text_field("xc", 500, 761-12, 16, 15)

parent_pdf.text_field("rt", 51, 700-15, 464, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}", :align => 2)
parent_pdf.text_field("yu", 120, 735-11, 125, 15)