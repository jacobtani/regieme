class UserMailer < ApplicationMailer
  default :from => "Iain and Tania <iainandtj.rsvp@gmail.com>"

  def rsvp_confirmation(rsvp:)
    @rsvp = rsvp
    mail(to: @rsvp.email, subject: "Thank you for RSVPing to Iain and Tanias Wedding")
  end
end
