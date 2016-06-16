class AdminMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def send_enquiry(guest, message)
    @message = message
    @guest = guest
    mail(from: @guest.email, to: 'tjterminator@gmail.com', subject: @message.subject)
  end

end
