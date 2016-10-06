class AdminMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def send_enquiry(guest, message)
    @message = message
    @guest = guest
    mail(from: @message.email, to: "Iain and TJ <tjterminator.dev@gmail.com>", subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp, guest)
    @rsvp = rsvp
    @guest = guest
    mail(from: @rsvp.email, to: "Iain and TJ <tjterminator.dev@gmail.com>", subject: "RSVP from #{guest.full_name}")
  end

  def gift_crossed (cg)
    @cg = cg
    mail(from: cg.guest_names, to: "Iain and TJ <tjterminator.dev@gmail.com>", subject: "Gift contributed by #{cg.guest_names}")
  end

end
