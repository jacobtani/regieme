require 'test_helper'

class GiftsControllerTest < ActionController::TestCase

  describe "Gifts Controller Tests" do
    let(:waffle_maker) { gifts(:waffle_maker) }
    let(:baking_bowl) { gifts(:baking_bowl) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "doesn't allow gift to be created when not logged in" do
        post :create, gift: { name: 'Cake tin', price: 10.99, description: 'Need a second 8 inch cake tin' }
        assert_response 302
        assert_redirected_to new_user_session_path
        @controller.instance_variable_get('@gift').must_equal nil
      end

      it "redirect user when trying to update a gift" do
        patch :update, id: waffle_maker, gift: { price: 10.99 }
        assert_response 302
        assert_redirected_to new_user_session_path
        @controller.instance_variable_get('@gift').must_equal nil
      end

      it "redirect user when trying to delete a gift" do
        assert_difference ->{ Gift.all.count }, 0 do
          delete :destroy, id: baking_bowl
        end
        assert_response 302
        assert_redirected_to new_user_session_path
      end
     
      it "should display all gifts if not logged in" do
        get :index
        assert_response 200
        assert_template :index
        assert_not_nil assigns(:gifts)
        assert_select "h2", "Gift Registry"
      end

     it "should be able to cross off gifts not logged in " do
       xhr :get, :cross_off_gift, format: :js, id: baking_bowl.id
       assert_response 200
     end

   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "a logged on user can add new gift" do
       post :create, gift: { name: 'Cake tin', price: 10.99, description: 'Need a second 8 inch cake tin' }
       assert flash[:success].must_equal 'Gift was created successfully.'
       assert_response 302
       assert_redirected_to gifts_path
       @controller.instance_variable_get('@gift').name.must_equal 'Cake tin'
       @controller.instance_variable_get('@gift').price.must_equal 10.99
       @controller.instance_variable_get('@gift').description.must_equal 'Need a second 8 inch cake tin'
     end

     it "a logged on user can't add new gift if mandatory field missing" do
       post :create, gift: { price: 10.99, description: 'Need a second 8 inch cake tin' }
       assert flash[:success].must_equal nil
       assert_response 200
       @controller.instance_variable_get('@gift').price.must_equal 10.99
       @controller.instance_variable_get('@gift').description.must_equal 'Need a second 8 inch cake tin'
       assert_template :new
     end

     it "a logged on user can update a gift" do
       patch :update, id: baking_bowl, gift: { gift_id: baking_bowl.id, price: 250 }
       assert_redirected_to gifts_path
       assert_response 302
       @controller.instance_variable_get('@gift').price.must_equal 250
     end

     it "a logged on user can't update a gift with invalid price" do
       patch :update, id: baking_bowl, gift: { gift_id: baking_bowl.id, price: -5 }
       assert_response 200
       assert_template :edit
     end

     it "admin can delete a gift" do
       assert_difference ->{ Gift.all.count }, -1 do
        delete :destroy, id: baking_bowl
       end
       assert_response 302
       assert_redirected_to gifts_path
     end
 
     it "admin can view all gifts" do
       get :index
       assert_response 200
       assert_select "h2", "Gift Registry"
       assert_template :index
       assert_not_nil assigns(:gifts)
     end
   
   end

 end

end