class AdminMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def send_enquiry(guest:, message:)
    @message = message
    @guest = guest
    mail(from: @message.email, to: "Iain and Tania <tjterminator.dev@gmail.com>", subject: @message.message_subject)
  end

  def rsvp_confirmation(rsvp:, guest:)
    @rsvp = rsvp
    @guest = guest
    mail(from: @rsvp.email, to: "Iain and Tania <tjterminator.dev@gmail.com>", subject: "RSVP from #{guest.full_name}")
  end

  def gift_crossed(contribution:)
    @contribution = contribution
    mail(from: contribution.guest_names, to: "Iain and Tania <tjterminator.dev@gmail.com>", subject: "Contribution to Honeymoon by #{contribution.guest_names}")
  end
end
