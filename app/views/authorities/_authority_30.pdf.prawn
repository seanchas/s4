move = 350
parent_pdf.move_down(move)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :style => :bold, :align => :center
parent_pdf.text_field("auth_num", 303, 774-move, 35, 15)

parent_pdf.text "г.____________________", :leading => 4
parent_pdf.text_field("year", 8, 750-move, 118, 15)

parent_pdf.text_field("position_agent2", 0, 724-move-18, 523, 15, :default => first_string(523, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("position_agent2field", 0, 724-move-17-18, 523, 15, :default => first_string(523, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("position_agent212", 39, 682-move-16, 484, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("ya",58, 675-move-17-15, 24, 15)
parent_pdf.text_field("gustav", 157, 675-move-17-15, 240, 15, :default => @vars['document_name'])

#first place

parent_pdf.text_field("position_agent2234", 0, 275-15, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 252-15, 40, 15)
parent_pdf.text_field("passport_num", 131, 252-15, 60, 15)
parent_pdf.text_field("passport_date", 232, 252-15, 291, 15)
parent_pdf.text_field("passport_date2", 0, 228-14, 523, 15)

parent_pdf.text_field("position_agent2244", 49, 150-13, 310, 15, :default => @vars['agent_fio'])

#parent_pdf.text_field("auth_create_day", 369, 400, 23, 15)
#parent_pdf.text_field("auth_create_month", 403, 400, 70, 15)
#parent_pdf.text_field("auth_create_year", 496, 398, 17, 15)

parent_pdf.text_field("as", 232, 118-8-12, 291, 15)
parent_pdf.text_field("sd", 90, 100-14-12, 433, 15)
parent_pdf.text_field("position_agent212", 55, 85-16-12, 468, 15, :align => 2)

parent_pdf.text "#{"_"*87}", :leading => 3
parent_pdf.text "<sup>(дата выдачи Доверенности прописью)</sup>", :leading => 4, :inline_format => true, :align => :center

parent_pdf.text "_______________________________________________________________________________________", :leading => 4
parent_pdf.text "_______________________________________________________________________________________", :leading => 3

parent_pdf.text "<sup>(наименование организации - Участника торгов )</sup>", :inline_format => true, :align => :center

parent_pdf.text "в лице  #{"_"*80},", :leading => 3, :align => :right

parent_pdf.text "<sup>(должность, Фамилия, Имя, Отчество)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ____ на основании #{"_"*40} \nдоверяет сотруднику:", :leading => 4

parent_pdf.text "#{"_"*87}", :leading => 3


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______  № __________, выдан ________________________________________________,", :leading => 3, :align => :right
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :align => :center
parent_pdf.text "_______________________________________________________________________________________"


parent_pdf.text "осуществлять введение от имени Участника в программно-технический комплекс ОАО Московская Биржа информации о готовности Участника заключить с Банком России сделки прямого РЕПО на внебиржевом рынке в соответствии с Договором между Участником и ОАО Московская Биржа «Об участии в Системе информационного обеспечения заключения Банком России сделок прямого РЕПО на внебиржевом рынке»."
parent_pdf.text "Подпись_____________________________________________________ удостоверяю.", :leading => 3
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность выдана без права передоверия.", :leading => 4, :align => :justify
parent_pdf.text "Настоящая Доверенность действительна до   ________________________________________________.", :leading => 3, :align => :right
parent_pdf.text "<sup>(срок действия Доверенности прописью)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Контактные тел.  ________________________________________________________________________", :align => :right, :leading => 4

parent_pdf.text "Подпись   #{"_"*78}", :leading => 3, :align => :right

parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\nМ.П.#{" "*20}", :align => :left, :indent_paragraphs => 50