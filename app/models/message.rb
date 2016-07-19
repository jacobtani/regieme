class Message
  include ActiveAttr::Model
  attribute :message_subject
  attribute :content
  attribute :full_name
  attribute :email
  validates_presence_of :message_subject
end