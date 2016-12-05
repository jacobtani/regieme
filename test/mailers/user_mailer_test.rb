require "test_helper"

class UserMailerTest < ActionMailer::TestCase
    let(:admin) { users(:admin) }
    let(:rsvp) { rsvps(:rsvp_one) }

  def test_rsvp_confirmation
    email = UserMailer.rsvp_confirmation(rsvp: rsvp).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["iainandtj.rsvp@gmail.com"], email.from
    assert_equal [rsvp.email], email.to
    assert_equal "Thank you for RSVPing to Iain and Tanias Wedding", email.subject
  end
end
