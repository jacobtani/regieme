require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase

  describe "Rsvps Controller Tests" do
    let(:anita) { guests(:aj) }
    let(:rsvp) { rsvps(:rsvp_one) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "allows rsvp to be created when not logged in" do
        post :create, rsvp: { full_name: 'Anita Troll', attending: 'Yes', email: 'anita@gmail.com', main_meal_preference: 'Steak', dessert_preference: 'Creme brulee' }
        assert_response 200
        assert_template :new
        assert_select "h2", "Rsvp"
        @controller.instance_variable_get('@guest').full_name.must_equal 'Anita Troll'
        @controller.instance_variable_get('@rsvp').email.must_equal 'anita@gmail.com'
        @controller.instance_variable_get('@rsvp').attending.must_equal 'Yes'
        @controller.instance_variable_get('@rsvp').main_meal_preference.must_equal 'Steak'
        @controller.instance_variable_get('@rsvp').dessert_preference.must_equal 'Creme brulee'

      end

      it "doesnt allow rsvp to be created when required fields missing when not logged in" do
        post :create, rsvp: { full_name: 'Anita Troll', attending: 'Yes' }
        assert_template :new
        assert_response 200
      end

      it "redirect user when trying to update a rsvp" do
        patch :update, id: rsvp, rsvp: { rsvp_id: rsvp.id, main_meal_preference: 'Chicken'}
        assert_redirected_to new_user_session_path 
        assert_response 302
        @controller.instance_variable_get('@rsvp').must_equal nil
      end

      it "redirect user when trying to delete a rsvp" do
        assert_difference ->{ Rsvp.all.count }, 0 do
          delete :destroy, id: rsvp
        end
        assert_response 302
        assert_redirected_to new_user_session_path 
      end
     
     it "should not display all rsvps if not logged in" do
        get :index
        assert_response 302
        assert_redirected_to new_user_session_path 
        assert_nil assigns(:rsvps)
     end
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new rsvp" do
        post :create, rsvp: { full_name: 'Anita Jacob', attending: 'Yes', email: 'anita@gmail.com', main_meal_preference: 'Steak', dessert_preference: 'Creme brulee' }
        assert_response 200
        assert_template :new
        assert_select "h2", "Rsvp"
        @controller.instance_variable_get('@rsvp').email.must_equal 'anita@gmail.com'
        @controller.instance_variable_get('@rsvp').attending.must_equal 'Yes'
        @controller.instance_variable_get('@rsvp').main_meal_preference.must_equal 'Steak'
        @controller.instance_variable_get('@rsvp').dessert_preference.must_equal 'Creme brulee'
     end

     it "logged on user can add new rsvp catches false name" do
        post :create, rsvp: { full_name: 'Test Ererer', attending: 'Yes', email: 'anita@gmail.com', main_meal_preference: 'Steak', dessert_preference: 'Creme brulee' }
        assert_response 200
        assert_template :new
        assert_select "h2", "Rsvp"
        @controller.instance_variable_get('@rsvp').attending.must_equal 'Yes'
        @controller.instance_variable_get('@rsvp').main_meal_preference.must_equal 'Steak'
     end

     it "logged on user can update a rsvp" do
       patch :update, id: rsvp, rsvp: { rsvp_id: rsvp.id, main_meal_preference: 'Chicken'}
       assert_response 302
       assert_redirected_to rsvps_path        
       @controller.instance_variable_get('@rsvp').main_meal_preference.must_equal 'Chicken'
     end

     it "logged on user can't update a rsvp with invalid data" do
       patch :update, id: rsvp, rsvp: { rsvp_id: rsvp.id, attending: nil}
       assert_response 200
       assert_template :edit
     end

     it "logged on user can delete a rsvp" do
       assert_difference ->{ Rsvp.all.count }, -1 do
        delete :destroy, id: rsvp
       end
       assert_response 302
       assert_redirected_to rsvps_path
     end
 
     it "logged on user can view all rsvps" do
       get :index
       assert_template :index
       assert_response 200
       assert_select "h2", "Rsvps"
       assert_not_nil assigns(:rsvps)
     end
   
   end

 end

end