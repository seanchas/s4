class NoticeController < OrganizationsController
  
  def show_notice
    data = show
    @organization = data[:organisation]
    @schema = data[:schema]
    @notice = data[:notice]
    
    render :show
  end
  
  def show_message
    data = show
    @organization = data[:organisation]
    @schema = data[:schema]
    @notice = data[:notice]
    
    render :show
  end
  
  def show_debt
    data = show
    @organization = data[:organisation]
    @schema = data[:schema]
    @notice = data[:notice]
    
    render :show
  end
  
  private
  def show
    id = params[:id]
    
    @organization = S4::Organization.find(s4_user)
    
    if !id.nil?
      excludeColumns = ["id", "type", "notice_type"]
      S4::NoticeDetails.scope = {:id => id}
      notice = S4::NoticeDetails.find_with_scope(s4_user)
      
      if notice.notice_type != "2"
        excludeColumns.push("priority")
      end
      
      schemaForForm = S4::NoticeDetails.schema.clone
      excludeColumns.each {|exclude_column| schemaForForm.columns.delete_if {|column| column.name == exclude_column}}
      
      if (notice.nil? or notice.user != s4_user)
        if notice.notice_type == "1"
          redirect_to messages_organization_path
        elsif (notice.notice_type == "2")
          redirect_to notice_organization_path
        elsif (notice.notice_type == "3")
          redirect_to controldebt_organization_path
        end
      end
      
      @return = {:schema => schemaForForm, :notice => notice, :organisation => @organization}
    else
      redirect_to organization_path
    end
  end
end