class Struktures < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :namus_vou, :namus_kou, :ystav_view, :firstname, :lastname, :otchestvo, :dolzhnost, :namus_kiou, :id, :user
end
