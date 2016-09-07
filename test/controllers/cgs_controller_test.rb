require 'test_helper'

class CgsControllerTest < ActionController::TestCase

  describe "Cgs Controller Tests" do
    let(:cg_one) { cgs(:cg_one) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "allows cg to be created when not logged in" do
        post :create, cg: { guest_names: 'Mr Smith', contribution_amount: 0 }
        assert_response 302
        assert_redirected_to gifts_path
        @controller.instance_variable_get('@cg').contribution_amount.must_equal 0      
        @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
      end

      it "does not allows cg to be created when invalid data and not logged in" do
        post :create, cg: { guest_names: nil }
        assert_response 302
        @controller.instance_variable_get('@cg').guest_names.must_equal nil
      end

      it "redirect user when trying to delete a cg" do
        assert_difference ->{ Cg.all.count }, 0 do
          delete :destroy, id: cg_one
        end
        assert_response 302
        assert_redirected_to new_user_session_path
      end

      it "should not display all cgs if not logged in" do
        get :index
        assert_response 302
        assert_redirected_to new_user_session_path
        assert_nil assigns(:cgs)
      end
     
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new cg" do
       post :create, cg: { guest_names: 'Mr Smith', contribution_amount: 10 }
       assert_response 302
       assert_redirected_to gifts_path
       @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
       @controller.instance_variable_get('@cg').contribution_amount.must_equal 10
     end

     it "logged on user can delete a cg" do
       cg_one.update_attributes(contribution_amount: 300)
       assert_difference ->{ Cg.all.count }, -1 do
        delete :destroy, id: cg_one
       end
       assert_response 302
       assert_redirected_to cgs_path
     end

     it "should display all cgs if logged in" do
       get :index
       assert_response 200
       assert_select "h2", "Claimed Gifts"
       assert_template :index
       assert_not_nil assigns(:cgs)
     end
   end
 end
end