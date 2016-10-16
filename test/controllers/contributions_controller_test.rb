require 'test_helper'

class ContributionsControllerTest < ActionController::TestCase

  describe "Contributions Controller Tests" do
    let(:contribution_one) { contributions(:contribution_one) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "allows contribution to be created when not logged in" do
        post :create, contribution: { guest_names: "Mr Smith", contribution_amount: 20 }
        assert_response 302
        assert_redirected_to gift_registry_path
        @controller.instance_variable_get('@contribution').contribution_amount.must_equal 20
        @controller.instance_variable_get('@contribution').guest_names.must_equal "Mr Smith"
      end

      it "does not allows contribution to be created when invalid data and not logged in" do
        post :create, contribution: { guest_names: nil, contribution_amount: 220 }
        assert_response 302
        @controller.instance_variable_get('@contribution').guest_names.must_equal ""
      end

      it "redirect user when trying to delete a contribution" do
        assert_difference ->{ Contribution.all.count }, 0 do
          delete :destroy, id: contribution_one
        end
        assert_response 302
        assert_redirected_to new_user_session_path
      end

      it "should not display all contributions if not logged in" do
        get :index
        assert_response 302
        assert_redirected_to new_user_session_path
        assert_nil assigns(:contributions)
      end
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new contribution" do
       post :create, contribution: { guest_names: "Mr Smith", contribution_amount: 10 }
       assert_response 302
       assert_redirected_to gift_registry_path
       @controller.instance_variable_get('@contribution').guest_names.must_equal "Mr Smith"
       @controller.instance_variable_get('@contribution').contribution_amount.must_equal 10
     end

     it "logged on user can delete a contribution" do
       contribution_one.update_attributes(contribution_amount: 300)
       assert_difference ->{ Contribution.all.count }, -1 do
        delete :destroy, id: contribution_one
       end
       assert_response 302
       assert_redirected_to contributions_path
     end

     it "should display all contributions if logged in" do
       get :index
       assert_response 200
       assert_select "h2", "Contributions"
       assert_template :index
       assert_not_nil assigns(:contributions)
     end
   end
 end
end
