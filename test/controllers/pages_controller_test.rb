require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  describe "Pages Controller Tests" do

    describe "actions by a non logged in user" do

      it "renders the details page" do
        get :the_details
        assert_response 200
        assert_select "h2", "The Wedding"
      end
 
      it "renders the welcome page" do
        get :welcome
        assert_response 200
      end

      it "renders the our_story page" do
        get :our_story
        assert_response 200
      end

      it "renders the accomodation page" do
        get :accomodation
        assert_response 200
        assert_select "h2", "Accomodation"
      end

      it "renders the people page" do
        get :people
        assert_response 200
        assert_select "h2", "People Involved"
        assert_select "h2", "Groomsmen"
        assert_select "h2", "Bridesmaids"
        assert_select "h2", "Wedding Party"
      end

      it "renders the contact_us page" do
        get :contact_us
        assert_response 200
        assert_select "h2", "Contact Us"
      end

    end

  end

end