class InsidersMailer < ActionMailer::Base
  
  def insider_file(author, file)
    recipients  "insider@micex.com"
    from        "cabinet-no-reply@micex.com"
    subject     "Insiders"
    reply_to    author
    
    attachment :content_type => file.content_type, :body => file.read
  end

end
