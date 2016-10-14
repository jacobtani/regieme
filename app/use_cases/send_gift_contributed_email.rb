class SendGiftContributedEmail
  include UseCasePattern

  validates :contribution, presence: true

  def initialize(contribution:)
    @contribution = contribution
  end

  def perform
    send_admin_email
  end

  private

  attr_reader :contribution

  def send_admin_email
    AdminMailer.gift_crossed(contribution: contribution).deliver_now
  end
end
