require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
    let(:admin) { users(:admin) }
    let(:rsvp) { rsvps(:rsvp_one) }

  def test_send_enquiry
    message = Message.new
    message.email= "gen@gmail.com"
    message.message_subject = "QUESTION ABOUT THE WEDDING"
    message.content = "I am vegan"
    email = AdminMailer.send_enquiry(message: message).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["gen@gmail.com"], email.from
    assert_equal ["iainandtj.rsvp@gmail.com"], email.to
    assert_equal 'QUESTION ABOUT THE WEDDING', email.subject
  end

  def test_rsvp_confirmation
    email = AdminMailer.rsvp_confirmation(rsvp: rsvp).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal [rsvp.email], email.from
    assert_equal ["iainandtj.rsvp@gmail.com"], email.to
    assert_equal "RSVP from #{rsvp.guest_name}", email.subject
  end
end
