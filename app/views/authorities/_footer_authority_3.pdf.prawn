#parent_pdf.text_field("phones", 115, 252, 343, 15)

parent_pdf.text_field("agent_fio1", 70, 367, 453, 15, :default => @vars['agent_fio'])
parent_pdf.text_field("agent_fio1", 48, 318, 370, 15, :default => @vars['agent_fio'])


parent_pdf.text_field("auth_create_day", 232, 294, 16, 15)
parent_pdf.text_field("auth_create_month", 255, 294, 60, 15)
parent_pdf.text_field("auth_create_year", 331, 294, 16, 15)

parent_pdf.text_field("phone_code", 91, 252, 23, 15)
parent_pdf.text_field("phone", 119, 252, 265, 15)

parent_pdf.text_field("agent_podpis", 0, 219, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 219, 95, 15, :default => @vars['cfs'])

parent_pdf.text "\n\n"


parent_pdf.text "Права и обязанности по сделкам с указанными в настоящей Доверенности Облигациями, заключенным #{"_"*75}", :leading => 4, :align => :justify


parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "от имени Участника, принадлежат Участнику.\n\n"


parent_pdf.text "Подпись #{"_"*62} удостоверяю.",:leading => 4



parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20___г.",:leading => 4
parent_pdf.text "\n\n"

parent_pdf.text "Контактные тел. (____)____________________________________________\n\n",:leading => 4


parent_pdf.text "#{"_"*50}#{" "*17} ___________/ ________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

#parent_pdf.text_field("podp", 78, 226, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
#parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :leading => 4
#parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50