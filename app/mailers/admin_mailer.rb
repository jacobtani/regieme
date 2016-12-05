class AdminMailer < ApplicationMailer
  default :to => "Iain and Tania <iainandtj.rsvp@gmail.com>"

  def send_enquiry(message:)
    @message = message
    mail(from: @message.email, subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp:)
    @rsvp = rsvp
    mail(from: @rsvp.email, subject: "RSVP from #{rsvp.guest_name}")
  end
end
