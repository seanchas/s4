parent_pdf.text "ДОВЕРЕННОСТЬ №__", :style => :bold, :align => :center
parent_pdf.text "г.____________\n\n"
parent_pdf.text "______________________________________________________________________________________", :leading => 4
parent_pdf.text "<sup>(дата выдачи Доверенности прописью)</sup>", :inline_format => true, :align => :center
parent_pdf.text "\n\n"
parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующе__ на основании #{@vars['document_name']},"
parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан _______________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 400

parent_pdf.text "осуществлять введение от имени Участника в программно-технический комплекс ЗАО «Московская межбанковская валютная биржа» информации о готовности Участника заключить с Банком России сделки прямого РЕПО на внебиржевом рынке в соответствии с Договором между Участником и ЗАО «Московская межбанковская валютная биржа» «Об участии в Системе информационного обеспечения заключения Банком России сделок прямого РЕПО на внебиржевом рынке».", :align => :justify 

parent_pdf.text "\n\n"
parent_pdf.text "Подпись #{@vars['agent_fio']} _____________________ удостоверяю.", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "Настоящая Доверенность выдана без права передоверия.", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Настоящая Доверенность действительна до ______________________________________.", :leading => 4, :indent_paragraphs => 30
parent_pdf.text "<sup>(срок действия Доверенности прописью)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. _________________________________________________________", :indent_paragraphs => 30
parent_pdf.text "\n\n"
parent_pdf.text "Подпись #{@vars['ceo_position']}, #{@vars['ceo_fio']} ___________/ ___________", :indent_paragraphs => 30, :leading => 4
parent_pdf.text "<sup>(занимаемая должность и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "М.П."