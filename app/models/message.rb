class Message
  include ActiveAttr::Model
  attribute :message_subject
  attribute :content
  attribute :first_name
  attribute :email
  validates_presence_of :message_subject
end