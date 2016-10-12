# == Schema Information
#
# Table name: cgs
#
#  id                  :integer          not null, primary key
#  guest_names         :string
#  contribution_amount :decimal(, )
#

require 'test_helper'

class ContributionTest < ActiveSupport::TestCase

  describe "Contribution Model Tests" do
    describe "invalid contributions" do
      it "doesn't allow invalid contributions to be created - missing gift_id " do
        @contribution = Contribution.create(guest_names: "TJ")
        @contribution.valid?.must_equal false
        assert_equal [:contribution_amount], @contribution.errors.keys
      end

    end

    describe "valid contributions" do
      it "creates valid contributions to be created" do
        @contribution = Contribution.create(guest_names: 'Troll Man', contribution_amount: 100 )
        @contribution.valid?.must_equal true
      end
    end
  end
end
