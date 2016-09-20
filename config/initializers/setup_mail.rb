ActionMailer::Base.smtp_settings = {
  :address              => ENV["MAIL_ADDRESS"],
  :port                 => ENV["PORT"],
  :user_name            => ENV["MAIL_USERNAME"],
  :password             => ENV["MAIL_PASSWORD"],
  :authentication       => ENV["AUTHENTICATION"],
  :enable_starttls_auto => true
}
