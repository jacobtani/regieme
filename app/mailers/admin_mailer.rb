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
    if @guest.email!= "NULL"
      mail(from: @guest.email, to: 'tjterminator.dev@gmail.com', subject: 'RSVP from ' + @guest.full_name)
    else
      mail(from: 'noemail', to: 'tjterminator.dev@gmail.com', subject: 'RSVP from ' + @guest.full_name)
    end
  end

  def gift_crossed (cg, gift)
    @cg = cg
    @gift = gift
    mail(from: cg.guest_names, to: 'tjterminator.dev@gmail.com', subject: "#{gift.name} crossed off by #{cg.guest_names}")
  end

end
