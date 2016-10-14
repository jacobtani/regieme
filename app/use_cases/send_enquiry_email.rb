class SendEnquiryEmail
  include UseCasePattern

  validates :guest, :message, presence: true

  def initialize(guest:, message:)
    @guest = guest
    @message = message
  end

  def perform
    send_admin_email
  end

  private

  attr_reader :guest, :message

  def send_admin_email
    AdminMailer.send_enquiry(guest: guest, message: message).deliver_now
  end
end
