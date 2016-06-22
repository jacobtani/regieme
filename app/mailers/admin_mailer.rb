class AdminMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def send_enquiry(guest, message)
    @message = message
    @guest = guest
    mail(from: @guest.email, to: 'tjterminator.dev@gmail.com', subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp, guest)
    @rsvp = rsvp
    @guest = guest
    mail(from: @guest.email, to: 'tjterminator.dev@gmail.com', subject: 'RSVP from ' + @guest.full_name)
  end

end
