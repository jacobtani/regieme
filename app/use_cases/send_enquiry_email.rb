class SendEnquiryEmail
  include UseCasePattern

  validates :message, presence: true

  def initialize(message:)
    @message = message
  end

  def perform
    send_admin_email
  end

  private

  attr_reader :message

  def send_admin_email
    AdminMailer.send_enquiry(message: message).deliver_now
  end
end
