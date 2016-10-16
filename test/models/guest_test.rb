require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  describe "Guest Model Tests" do
    let(:gen) { guests(:gw) }

    describe "identifies full name of guest correctly" do
      it "gets the right full name for a user" do
        gen.full_name.must_equal "Gen Cool"
      end
    end
  end
end
