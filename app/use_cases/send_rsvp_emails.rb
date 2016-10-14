class SendRsvpEmails
  include UseCasePattern

  validates :rsvp, :guest, presence: true

  def initialize(rsvp:, guest:)
    @rsvp = rsvp
    @guest = guest
  end

  def perform
    send_user_email
    send_admin_email
  end

  private

  attr_reader :rsvp, :guest

  def send_user_email
    UserMailer.rsvp_confirmation(rsvp: rsvp, guest: guest).deliver_now
  end

  def send_admin_email
    AdminMailer.rsvp_confirmation(rsvp: rsvp, guest: guest).deliver_now
  end
end
