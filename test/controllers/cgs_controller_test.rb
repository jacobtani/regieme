require 'test_helper'

class CgsControllerTest < ActionController::TestCase

  describe "Cgs Controller Tests" do
    let(:cg_one) { cgs(:cg_one) }
    let(:user) { users(:admin) }
    let(:baking_bowl) { gifts(:baking_bowl)}
    let(:waffle_maker) { gifts(:waffle_maker)}

    describe "actions by a non logged in user" do

      it "allows cg to be created when not logged in" do
        assert baking_bowl.remainder_available.must_equal 1
        post :create, cg: { item_name: 'Baking Bowl', gift_id: baking_bowl.id, guest_names: 'Mr Smith' }
        assert_response 302
        assert_redirected_to gifts_path
        @controller.instance_variable_get('@gift').remainder_available.must_equal 0      
        @controller.instance_variable_get('@cg').item_name.must_equal 'Baking Bowl'
        @controller.instance_variable_get('@cg').gift_id.must_equal baking_bowl.id
        @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
      end

      it "does not allows cg to be created when invalid data and not logged in" do
        post :create, cg: { item_name: 'Baking Bowl', gift_id: baking_bowl.id, guest_names: nil }
        assert_response 200
        @controller.instance_variable_get('@cg').item_name.must_equal 'Baking Bowl'
        @controller.instance_variable_get('@cg').gift_id.must_equal baking_bowl.id
        @controller.instance_variable_get('@cg').guest_names.must_equal nil
        assert_template :new
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
        assert_nil assigns(:cgs)
      end
     
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new cg" do
       assert baking_bowl.remainder_available.must_equal 1
       post :create, cg: { item_name: 'Baking Bowl', gift_id: baking_bowl.id, guest_names: 'Mr Smith' }
       assert_response 302
       assert_redirected_to gifts_path
       @controller.instance_variable_get('@gift').remainder_available.must_equal 0      
       @controller.instance_variable_get('@cg').item_name.must_equal 'Baking Bowl'
       @controller.instance_variable_get('@cg').gift_id.must_equal baking_bowl.id
       @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
     end

     it "logged on user can delete a cg" do
       cg_one.update_attributes(gift_id: waffle_maker.id)
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