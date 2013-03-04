parent_pdf.font_families.update(
   "TimesNewRoman" => { :bold        => "#{RAILS_ROOT}/public/fonts/timesbd.ttf",
                           :italic      => "#{RAILS_ROOT}/public/fonts/timesi.ttf",
                           :bold_italic => "#{RAILS_ROOT}/public/fonts/timesbi.ttf",
                           :normal      => "#{RAILS_ROOT}/public/fonts/times.ttf" })
parent_pdf.font "TimesNewRoman", :style => :normal
parent_pdf.font_size 12
