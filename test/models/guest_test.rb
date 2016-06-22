# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  first_name :string
#  surname    :string
#  address    :text
#  email      :string
#

require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  describe "Guest Model Tests" do
    let(:gen) { guests(:gw) }

    describe "invalid guests" do

      it "doesn't allow invalid guests to be created - missing surname " do
        @guest = Guest.create(first_name: 'Rachel', address: '5 Ring Lane, Newlands', email: 'rachel@gmail.com')
        @guest.valid?.must_equal false
        assert_equal [:surname], @guest.errors.keys
      end

    end

    describe "valid guests" do 

      it "creates valid guests to be created" do
        @guest = Guest.create(first_name: 'Rachel', surname: 'Bro', address: '5 Ring Lane, Newlands', email: 'rachel@gmail.com')
        @guest.valid?.must_equal true
      end

    end

    describe "identifies full name of guest correctly" do

      it "gets the right full name for a user" do
        gen.full_name.must_equal 'Gen Cool'
      end

    end

  end

end
