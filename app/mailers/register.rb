class Register < ActionMailer::Base
  default :from => "notifications@example.com"
  
  
  def start_reg_email(email1)
    @email=email1
    mail(:to => email1, :subject => "Welcome to My Awesome Site")
  end
  
end
