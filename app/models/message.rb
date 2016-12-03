class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :message_subject, :guest_name, :guest_email

  validates :message_subject, :guest_name, :guest_email, presence: true
  validates :full_name, format: { with: /[a-zA-Z]/}
  validates_length_of :content, :maximum => 500

  def initialize(attributes = {})
    unless attributes.nil?
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def persisted?
    false
  end
end
