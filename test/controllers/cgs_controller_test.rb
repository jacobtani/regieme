require 'test_helper'

class CgsControllerTest < ActionController::TestCase

  describe "Cgs Controller Tests" do
    let(:cg_one) { cgs(:cg_one) }
    let(:user) { users(:admin) }
    let(:baking_bowl) { gifts(:baking_bowl)}
    let(:waffle_maker) { gifts(:waffle_maker)}

    describe "actions by a non logged in user" do

      it "allows cg to be created when not logged in" do
       post :create, cg: { item_name: 'Baking Bowl', gift_id: baking_bowl.id, guest_names: 'Mr Smith' }
       assert_response 302
       @controller.instance_variable_get('@cg').item_name.must_equal 'Baking Bowl'
       @controller.instance_variable_get('@cg').gift_id.must_equal baking_bowl.id
       @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
      end

      it "redirect user when trying to delete a cg" do
        assert_difference ->{ Cg.all.count }, 0 do
          delete :destroy, id: cg_one
        end
        assert_response :redirect
      end
     
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new cg" do
       post :create, cg: { item_name: 'Baking Bowl', gift_id: baking_bowl.id, guest_names: 'Mr Smith' }
       assert_response 302
       @controller.instance_variable_get('@cg').item_name.must_equal 'Baking Bowl'
       @controller.instance_variable_get('@cg').gift_id.must_equal baking_bowl.id
       @controller.instance_variable_get('@cg').guest_names.must_equal 'Mr Smith'
     end

     it "logged on user can delete a cg" do
       cg_one.update_attributes(gift_id: waffle_maker.id)
       assert_difference ->{ Cg.all.count }, -1 do
        delete :destroy, id: cg_one
       end
       assert_response :redirect
     end
    
   end

 end

end