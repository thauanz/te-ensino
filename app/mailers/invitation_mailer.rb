class InvitationMailer < ActionMailer::Base
  default :from => "no-reply@te-ensino.com"
          
  def registration_teacher(user)
    @user = user
    mail(:to => @user.email, :subject => "te-ensino.convite")
  end
end
