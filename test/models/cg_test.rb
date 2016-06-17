require 'test_helper'

class CgTest < ActiveSupport::TestCase

  describe "Cg Model Tests" do
    let(:waffle_maker) { gifts(:waffle_maker) }

    describe "invalid cgs" do

      it "doesn't allow invalid cgs to be created - missing gift_id " do
        @cg = Cg.create(item_name: 'Waffle Maker', gift_id: waffle_maker.id)
        @cg.valid?.must_equal false
        assert_equal [:guest_names], @cg.errors.keys
      end

    end

    describe "valid cgs" do 

      it "creates valid cgs to be created" do
        @cg = Cg.create(guest_names: 'Troll Man', item_name: 'Waffle Maker', gift_id: waffle_maker.id )
        @cg.valid?.must_equal true
      end

    end

  end

end