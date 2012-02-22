class Organizations::Phones < Organizations::AbstractForm
  column :no_phone_valuta, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :valuta, {:as => :grid, :empty_checkbox => :no_phone_valuta}, Organizations::Grids::Phones::Phones_v.new
  
  column :no_phone_fondovii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :fondovii, {:as => :grid, :empty_checkbox => :no_phone_fondovii}, Organizations::Grids::Phones::Phones_f.new
  
  column :no_phone_srochnii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :srochnii, {:as => :grid, :empty_checkbox => :no_phone_srochnii}, Organizations::Grids::Phones::Phones_s.new
  
  column :no_phone_cenii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :cenii, {:as => :grid, :empty_checkbox => :no_phone_cenii}, Organizations::Grids::Phones::Phones_c.new
  
  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => "window.location = '/organization/reset?section=phones';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.phones
    [
      {:input => :submit}
    ] << cancelButton
  end
end