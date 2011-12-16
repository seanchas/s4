parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :style => :bold, :align => :center
parent_pdf.text_field("auth_num", 303, 774, 35, 15)

parent_pdf.text "г.____________________\n\n"
parent_pdf.text_field("year", 8, 749, 120, 15)
parent_pdf.text_field("data_spend", 0, 724, 523, 15)

parent_pdf.text_field("position_agent2", 145, 674, 378, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text_field("position_agent32", 0, 650, 523, 15)

parent_pdf.text_field("position_agent212", 87, 633, 436, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("ya",58, 610, 13, 15)
parent_pdf.text_field("gustav", 145, 610, 240, 15, :default => @vars['document_name'])

parent_pdf.text_field("position_agent2234", 0, 592, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 568, 40, 15)
parent_pdf.text_field("passport_num", 129, 568, 60, 15)
parent_pdf.text_field("passport_date", 230, 568, 293, 15)
parent_pdf.text_field("passport_date2", 0, 545, 523, 15)

parent_pdf.text_field("position_agent2234", 48, 438, 370, 15, :default => @vars['agent_fio'])

parent_pdf.text_field("auth_create_day", 230, 377, 17, 15)
parent_pdf.text_field("auth_create_month", 253, 377, 60, 15)
parent_pdf.text_field("auth_create_year", 329, 377, 17, 15)

parent_pdf.text_field("phone_code", 91, 339, 23, 15)
parent_pdf.text_field("phone", 120, 339, 265, 15)

parent_pdf.text_field("agent_podpis", 0, 314, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 314, 95, 15, :default => @vars['cfs'])

parent_pdf.text "______________________________________________________________________________________", :leading => 4
parent_pdf.text "<sup>(дата выдачи Доверенности прописью)</sup>", :inline_format => true, :align => :center

parent_pdf.text "\n\n"



parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "Участник в лице #{"_"*70},", :leading => 4

#parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :leading => 4, :indent_paragraphs => 30, :align => :justify
#parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4

parent_pdf.text "<sup>(занимаемая должность сотрудника Участника, фамилия имя отчество)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующ__ на основании #{"_"*40}, доверяет сотруднику", :leading => 4

parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "осуществлять введение от имени Участника в программно-технический комплекс ОАО «ММВБ-РТС» информации о готовности Участника заключить с Банком России сделки прямого РЕПО на внебиржевом рынке в соответствии с Договором между Участником и ОАО «ММВБ-РТС» «Об участии в Системе информационного обеспечения заключения Банком России сделок прямого РЕПО на внебиржевом рынке».", :align => :justify 

parent_pdf.text "\n\n"

parent_pdf.text "Подпись #{"_"*62} удостоверяю.", :leading => 4

parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность выдана без права передоверия."
parent_pdf.text "\n\n"

parent_pdf.text "Настоящая доверенность действительна по «___»__________ 20___г. включительно."
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. (____)____________________________________________"
parent_pdf.text "\n"

parent_pdf.text "#{"_"*50}#{" "*17} ___________/ ________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

#parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :leading => 4

#parent_pdf.text "Подпись #{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4
#parent_pdf.text_field("podp", 78, 297, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
#parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50