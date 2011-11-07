parent_pdf.text "ДОВЕРЕННОСТЬ №__", :align => :center
parent_pdf.text "г.________________________________________#{" "*37}«__» __________ 20__г."
parent_pdf.text " "
parent_pdf.text " "
parent_pdf.text "Настоящей Доверенностью   #{@vars['organization_name']}  ", :leading => 4
parent_pdf.text "#{" "*60}<sup>(наименование организации-Участника)</sup>", :inline_format => true, :indent_paragraphs => 250
parent_pdf.text "в лице   #{@vars['ceo_position']}, #{@vars['ceo_fio']}  ,", :leading => 4
parent_pdf.text "#{" "*30}<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 90
parent_pdf.text "действующее__ на основании   #{@vars['document_name']}  ,"
parent_pdf.text "доверяет сотруднику   #{@vars['agent_position']}, #{@vars['agent_fio']}  ", :leading => 4
parent_pdf.text "#{" "*45}<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "паспорт серия ______ № __________, выдан __________________________________________,", :leading => 4
parent_pdf.text "#{" "*90}<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300
parent_pdf.text "представлять   #{@vars['organization_name']}  ", :leading => 4
parent_pdf.text "#{" "*35}<sup>(наименование организации-Участника)</sup>", :inline_format => true, :indent_paragraphs => 150