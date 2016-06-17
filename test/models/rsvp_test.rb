require 'test_helper'

class RsvpTest < ActiveSupport::TestCase

  describe "RSVP Model Tests" do
    let(:gen) { guests(:gw) }

    describe "invalid rsvps" do

      it "doesn't allow invalid rsvps to be created - missing price " do
        @rsvp = Rsvp.create(attending: 'Yes', guest_id: gen.id)
        @rsvp.valid?.must_equal false
        assert_equal [:meal_preference], @rsvp.errors.keys
      end

    end

    describe "valid categories" do 

      it "creates valid categories to be created" do
        @rsvp = Rsvp.create(attending: 'Yes', guest_id: gen.id, meal_preference: 'Chicken')
        @rsvp.valid?.must_equal true
      end

    end

  end

end