require 'test_helper'

class GuestsControllerTest < ActionController::TestCase

  describe "Guests Controller Tests" do
    let(:gen) { guests(:gw) }
    let(:anita) { guests(:aj) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "doesn't allow guest to be created when not logged in" do
        post :create, guest: { first_name: 'Louis', surname: 'TheMan', address: '1 Cake Rd, Newtown', email: 'louis@gmail.com' }
        assert_response 302
        @controller.instance_variable_get('@guest').must_equal nil
      end

      it "rredirect user when trying to update a guest" do
        patch :update, id: gen, guest: { guest_id: gen.id, email: 'genevieve@gmail.com'}
        assert_response 302
        @controller.instance_variable_get('@guest').must_equal nil
      end

      it "redirect user when trying to delete a guest" do
        assert_difference ->{ Guest.all.count }, 0 do
          delete :destroy, id: anita
        end
        assert_response :redirect
      end
     
     it "should not display all guests if not logged in" do
        get :index
        assert_response 302
        assert_nil assigns(:guests)
     end
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new guest" do
       post :create, guest: { first_name: 'Louis', surname: 'TheMan', address: '1 Kfry Rd, Newtown', email: 'louis@gmail.com' }
       assert flash[:success].must_equal 'Guest was created successfully.'
       assert_response 302
       @controller.instance_variable_get('@guest').first_name.must_equal 'Louis'
       @controller.instance_variable_get('@guest').surname.must_equal 'TheMan'
       @controller.instance_variable_get('@guest').address.must_equal '1 Kfry Rd, Newtown'
       @controller.instance_variable_get('@guest').email.must_equal 'louis@gmail.com'
     end

     it "logged on user can't add new guest with required fields missing" do
       post :create, guest: { first_name: 'Louis', address: '1 Kfry Rd, Newtown', email: 'louis@gmail.com' }
       assert_response 200
       @controller.instance_variable_get('@guest').first_name.must_equal 'Louis'
       @controller.instance_variable_get('@guest').address.must_equal '1 Kfry Rd, Newtown'
       @controller.instance_variable_get('@guest').email.must_equal 'louis@gmail.com'
     end

     it "logged on user can update a guest" do
       patch :update, id: gen, guest: { id: gen.id, email: 'genevieve@gmail.com'}
       assert_response 302
       @controller.instance_variable_get('@guest').email.must_equal 'genevieve@gmail.com'
     end

     it "logged on user can't update a guest with invalid data" do
       patch :update, id: gen, guest: { id: gen.id, first_name: nil }
       assert_response 200
     end

     it "logged on user can delete a guest" do
       assert_difference ->{ Guest.all.count }, -1 do
        delete :destroy, id: anita
       end
       assert_response :redirect
     end
 
     it "logged on user can view all guests" do
       get :index
       assert_response 200
       assert_not_nil assigns(:guests)
     end
   
   end

 end

end