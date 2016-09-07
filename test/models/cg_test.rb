# == Schema Information
#
# Table name: cgs
#
#  id          :integer          not null, primary key
#  guest_names :string
#  item_name   :string
#  gift_id     :integer          not null
#

require 'test_helper'

class CgTest < ActiveSupport::TestCase

  describe "Cg Model Tests" do

    describe "invalid cgs" do

      it "doesn't allow invalid cgs to be created - missing gift_id " do
        @cg = Cg.create(guest_names: "TJ")
        @cg.valid?.must_equal false
        assert_equal [:contribution_amount], @cg.errors.keys
      end

    end

    describe "valid cgs" do 

      it "creates valid cgs to be created" do
        @cg = Cg.create(guest_names: 'Troll Man', contribution_amount: 100 )
        @cg.valid?.must_equal true
      end

    end

  end

end
