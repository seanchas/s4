parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :style => :bold, :align => :center
parent_pdf.text_field("auth_num", 303, 774, 35, 15)

parent_pdf.text "г.____________________\n\n"
parent_pdf.text_field("year", 8, 749, 120, 15)
parent_pdf.text_field("data_spend", 0, 724, 523, 15)

parent_pdf.text_field("ya",62, 610, 13, 15)

parent_pdf.text_field("passport_ser", 74, 556, 40, 15)
parent_pdf.text_field("passport_num", 129, 556, 60, 15)
parent_pdf.text_field("passport_date", 230, 556, 293, 15)
parent_pdf.text_field("passport_date2", 0, 532, 523, 15)

#parent_pdf.text_field("podpis", 255, 405, 230, 15)

parent_pdf.text_field("phones", 115, 307, 345, 15)
parent_pdf.text "______________________________________________________________________________________", :leading => 4
parent_pdf.text "<sup>(дата выдачи Доверенности прописью)</sup>", :inline_format => true, :align => :center

parent_pdf.text "\n\n"


parent_pdf.text_field("position_agent2", 145, 674, 378, 15, :default => "#{@vars['organization_name']}")
parent_pdf.text "Настоящей Доверенностью #{"_"*63}", :leading => 4
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text_field("position_agent32", 0, 650, 523, 15)
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text_field("position_agent212", 35, 633, 488, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4

#parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :leading => 4, :indent_paragraphs => 30, :align => :justify
#parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующе__ на основании #{@vars['document_name']},"


parent_pdf.text_field("position_agent223", 110, 596, 413, 15, :default => @vars['agent_position'])
parent_pdf.text "доверяет сотруднику #{"_"*68}", :leading => 4
parent_pdf.text_field("position_agent2234", 0, 580, 523, 15, :default => @vars['agent_fio'])
parent_pdf.text "#{"_"*87}", :leading => 4

#parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4


parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "осуществлять введение от имени Участника в программно-технический комплекс ЗАО «Московская межбанковская валютная биржа» информации о готовности Участника заключить с Банком России сделки прямого РЕПО на внебиржевом рынке в соответствии с Договором между Участником и ЗАО «Московская межбанковская валютная биржа» «Об участии в Системе информационного обеспечения заключения Банком России сделок прямого РЕПО на внебиржевом рынке».", :align => :justify 

parent_pdf.text "\n\n"


parent_pdf.text_field("position_agent2234", 78, 426, 240, 15, :default => @vars['agent_fio'])
parent_pdf.text "Подпись #{"_"*40} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "Настоящая Доверенность выдана без права передоверия.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Настоящая Доверенность действительна до ______________________________________.", :leading => 4, :indent_paragraphs => 30
parent_pdf.text "<sup>(срок действия Доверенности прописью)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________", :indent_paragraphs => 30
parent_pdf.text "\n\n"

parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :indent_paragraphs => 30, :leading => 4

#parent_pdf.text "Подпись #{@vars['ceo_position']}, #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4
parent_pdf.text_field("podp", 78, 268, 300, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П."