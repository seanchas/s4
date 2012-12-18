class Organizations::AbstractForm < Base
  cattr_accessor :s4_user
  attr_accessor :change_alert

  def s4_user
    Organizations::AbstractForm.s4_user
  end

  def countries
    @countries ||= S4::Country.all(s4_user)
  end
  
  def change_alert
    @change_alert = false if @change_alert.nil?
    @change_alert
  end
end