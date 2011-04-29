ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "te-ensino.heroku.com",
  :user_name            => "admin",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
