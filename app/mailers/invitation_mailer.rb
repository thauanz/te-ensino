class InvitationMailer < ActionMailer::Base
  default :from => "no-reply@appead.com"
          
  def registration_teacher(user)
    @user = user
    mail(:to => @user.email, :subject => "Convite")
  end
end
