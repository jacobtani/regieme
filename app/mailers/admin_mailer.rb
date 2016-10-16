class AdminMailer < ApplicationMailer
  default :to => "Iain and Tania <tjterminator.dev@gmail.com>"

  def send_enquiry(guest:, message:)
    @guest = guest
    @message = message
    mail(from: @message.email, subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp:, guest:)
    @rsvp = rsvp
    @guest = guest
    mail(to: "Iain and Tania <tjterminator.dev@gmail.com>", from: @rsvp.email, subject: "RSVP from #{guest.full_name}")
  end

  def gift_crossed(contribution:)
    @contribution = contribution
    mail(from: contribution.guest_names, subject: "Contribution to Honeymoon by #{contribution.guest_names}")
  end
end
