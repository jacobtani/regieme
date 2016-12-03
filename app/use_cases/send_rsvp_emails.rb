class SendRsvpEmails
  include UseCasePattern

  validates :rsvp, presence: true

  def initialize(rsvp:)
    @rsvp = rsvp
  end

  def perform
    send_user_email
    send_admin_email
  end

  private

  attr_reader :rsvp

  def send_user_email
    UserMailer.rsvp_confirmation(rsvp: rsvp).deliver_now
  end

  def send_admin_email
    AdminMailer.rsvp_confirmation(rsvp: rsvp).deliver_now
  end
end
