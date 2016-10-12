class UserMailer < ApplicationMailer

  def rsvp_confirmation(rsvp:, guest:)
    @rsvp = rsvp
    @guest = guest
    mail(from:"Iain and TJ <tjterminator.dev@gmail.com>", to: @rsvp.email, subject: "Thank you for RSVPing to Iain and Tanias Wedding")
  end
end
