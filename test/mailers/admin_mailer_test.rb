require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
    let(:admin) { users(:admin) }
    let(:guest) { guests(:gw) }
    let(:rsvp) { rsvps(:rsvp_one) }

  def test_send_enquiry
    message = Message.new 
    message.email= guest.email
    message.message_subject = 'QUESTION ABOUT THE WEDDING'
    message.content = 'I am vegan'
    email = AdminMailer.send_enquiry(guest, message).deliver_now
    assert_not ActionMailer::Base.deliveries.empty? 
    assert_equal ['gen@gmail.com'], email.from
    assert_equal ['tjterminator.dev@gmail.com'], email.to
    assert_equal 'QUESTION ABOUT THE WEDDING', email.subject
  end

  def test_rsvp_confirmation
    email = AdminMailer.rsvp_confirmation(rsvp, guest).deliver_now
    assert_not ActionMailer::Base.deliveries.empty? 
    assert_equal [guest.email], email.from
    assert_equal ['tjterminator.dev@gmail.com'], email.to
    assert_equal "RSVP from #{guest.full_name}", email.subject
  end

 end
