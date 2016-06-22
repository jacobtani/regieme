# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string           not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  describe "Category Model Tests" do

    describe "invalid categories" do

      it "doesn't allow invalid categories to be created - missing price " do
        @category = Category.create
        @category.valid?.must_equal false
        assert_equal [:name], @category.errors.keys
      end

    end

    describe "valid categories" do 

      it "creates valid categories to be created" do
        @category = Category.create(name: 'Furniture')
        @category.valid?.must_equal true
      end

    end

  end

end
