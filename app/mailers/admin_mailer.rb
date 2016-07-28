class AdminMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def send_enquiry(guest, message)
    @message = message
    @guest = guest
    mail(from: @message.email, to: 'tjterminator.dev@gmail.com', subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp, guest)
    @rsvp = rsvp
    @guest = guest
    mail(from: @rsvp.email, to: 'tjterminator.dev@gmail.com', subject: 'RSVP from ' + @guest.full_name)
  end

  def gift_crossed (cg, gift)
    @cg = cg
    @gift = gift
    mail(from: cg.guest_names, to: 'tjterminator.dev@gmail.com', subject: "#{gift.name} crossed off by #{cg.guest_names}")
  end

end
