class UserMailer < ApplicationMailer
  default :from => "Iain and Tania <iwandtj.rsvp@gmail.com>"

  def rsvp_confirmation(rsvp:, guest:)
    @rsvp = rsvp
    @guest = guest
    mail(to: @rsvp.email, subject: "Thank you for RSVPing to Iain and Tanias Wedding")
  end
end
