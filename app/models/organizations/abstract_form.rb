class Organizations::AbstractForm < Base
  cattr_accessor :s4_user
  def s4_user
    Organizations::AbstractForm.s4_user
  end
end