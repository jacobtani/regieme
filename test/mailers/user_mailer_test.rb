require "test_helper"

class UserMailerTest < ActionMailer::TestCase
    let(:admin) { users(:admin) }
    let(:guest) { guests(:gw) }
    let(:rsvp) { rsvps(:rsvp_one) }

  def test_rsvp_confirmation
    email = UserMailer.rsvp_confirmation(rsvp: rsvp, guest: guest).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['iwandtj.rsvp@gmail.com'], email.from
    assert_equal [guest.email], email.to
    assert_equal 'Thank you for RSVPing to Iain and Tanias Wedding', email.subject
  end
end
