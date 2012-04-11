class NoticeController < OrganizationsController
  
  def show_notice
    data = show
    if data[:notice].nil?
      redirect_to organization_path
    else
      @organization = data[:organisation]
      @schema = data[:schema]
      @notice = data[:notice]
      
      render :show
    end
  end
  
  def show_message
    data = show
    if data[:notice].nil?
      redirect_to organization_path
    else
      @organization = data[:organisation]
      @schema = data[:schema]
      @notice = data[:notice]
      
      render :show
    end
  end
  
  def show_debt
    data = show
    if data[:notice].nil?
      redirect_to organization_path
    else
      @organization = data[:organisation]
      @schema = data[:schema]
      @notice = data[:notice]
    
      render :show
    end
  end
  
  private
  def show
    id = params[:id]
    
    @organization = S4::Organization.find(s4_user)
    
    if !id.nil?
      excludeColumns = ["id", "type", "notice_type"]
      S4::NoticeDetails.scope = {:id => id}
      notice = S4::NoticeDetails.find_with_scope(s4_user)
      schemaForForm = S4::NoticeDetails.schema.clone
      
      if (!notice.nil? && !notice.attributes.empty?)
        if notice.notice_type != "2"
          excludeColumns.push("priority")
        end
        
        excludeColumns.each {|exclude_column| schemaForForm.columns.delete_if {|column| column.name == exclude_column}}
        
        if (notice.user != s4_user)
          if notice.notice_type == "1"
            redirect_to messages_organization_path
          elsif (notice.notice_type == "2")
            redirect_to notice_organization_path
          elsif (notice.notice_type == "3")
            redirect_to controldebt_organization_path
          end
        end
      else
        notice = nil
      end
      
      @return = {:schema => schemaForForm, :notice => notice, :organisation => @organization}
    end
  end
end