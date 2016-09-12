# == Schema Information
#
# Table name: rsvps
#
#  id                   :integer          not null, primary key
#  attending            :string           not null
#  main_meal_preference :string
#  dessert_preference   :string
#  dietary_requirements :text
#  guest_id             :integer          not null
#  email                :string           not null
#

require 'test_helper'

class RsvpTest < ActiveSupport::TestCase

  describe "RSVP Model Tests" do
    let(:anita) { guests(:aj) }

    describe "invalid rsvps" do

      it "doesn't allow invalid rsvps to be created - missing main meal and dessert preference " do
        @rsvp = Rsvp.create(attending: 'Yes', guest_id: anita.id, email: 'anita@gmail.com')
        @rsvp.valid?.must_equal false
        assert_equal [:main_meal_preference, :dessert_preference], @rsvp.errors.keys
      end

    end

    describe "valid categories" do 

      it "creates valid categories to be created" do
        @rsvp = Rsvp.create(attending: 'Yes', email: 'anita@gmail.com', guest_id: anita.id, main_meal_preference: 'Chicken', dessert_preference: 'Creme brulee')
        @rsvp.valid?.must_equal true
      end

    end

  end

end
