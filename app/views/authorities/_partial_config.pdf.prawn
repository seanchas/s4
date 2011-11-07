parent_pdf.font_families.update(
   "DejaVuSans" => { :bold        => "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf",
                           :italic      => "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf",
                           :bold_italic => "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf",
                           :normal      => "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf" })
parent_pdf.font "DejaVuSans", :style => :normal
parent_pdf.font_size 12