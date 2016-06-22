# == Schema Information
#
# Table name: gifts
#
#  id                  :integer          not null, primary key
#  description         :text             not null
#  guest_id            :integer
#  desired_quantity    :integer          default(0)
#  remainder_available :integer          default(0)
#  website_link        :text
#  category_id         :integer
#  price               :float            default(0.0)
#  name                :string
#

require 'test_helper'

class GiftTest < ActiveSupport::TestCase

  describe "Gift Model Tests" do

    describe "invalid gifts" do

      it "doesn't allow invalid gifts to be created - missing price " do
        @gift = Gift.create(name: 'Oven Tray', price: '49.99')
        @gift.valid?.must_equal false
        assert_equal [:description], @gift.errors.keys
      end

    end

    describe "valid gifts" do 

      it "creates valid gifts to be created" do
        @gift = Gift.create(name: 'Oven Tray', description: 'We have no oven trays', price: '49.99')
        @gift.valid?.must_equal true
      end

    end

  end

end
