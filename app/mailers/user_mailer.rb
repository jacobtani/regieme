class UserMailer < ApplicationMailer
  default from: "tjterminator.dev@gmail.com"

  def rsvp_confirmation(rsvp, guest)
    @rsvp = rsvp
    @guest = guest
    mail(from:'tjterminator.dev@gmail.com', to: @guest.email, subject: 'Thank you for RSVPing to Iain and Tanias Wedding')
  end

end
