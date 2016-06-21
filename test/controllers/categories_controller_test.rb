require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  describe "Category Controller Tests" do
    let(:kitchen) { categories(:kitchen) }
    let(:entertainment) { categories(:entertainment) }
    let(:user) { users(:admin) }

    describe "actions by a non logged in user" do

      it "doesn't allow category to be created when not logged in" do
        post :create, category: { name: 'Electronics' }
        assert_response 302
        @controller.instance_variable_get('@category').must_equal nil
      end

      it "doesn't allow category to be created when invalid data and not logged in" do
        post :create, category: { name: 1212 }
        assert_response 302
        @controller.instance_variable_get('@category').must_equal nil
      end

      it "redirect user when trying to update a category" do
        patch :update, id: kitchen, category: { category_id: kitchen.id, name: 'Le Kitchen'}
        assert_response 302
        @controller.instance_variable_get('@category').must_equal nil
      end

      it "redirect user when trying to delete a category" do
        assert_difference ->{ Category.all.count }, 0 do
          delete :destroy, id: entertainment
        end
        assert_response :redirect
      end
     
   end

   describe "actions by logged in user" do

     before do
       sign_in user
     end

     it "logged on user can add new category" do
       post :create, category: { name: 'Electronics' }
       assert flash[:success].must_equal 'Category was created successfully.'
       assert_response 302
       @controller.instance_variable_get('@category').name.must_equal 'Electronics'
     end

     it "logged on user can update a category" do
       patch :update, id: kitchen, category: { category_id: kitchen.id, name: 'Le Kitchen'}
       assert_response 302
       @controller.instance_variable_get('@category').name.must_equal 'Le Kitchen'
     end

     it "logged on user can delete a category" do
       assert_difference ->{ Category.all.count }, -1 do
        delete :destroy, id: entertainment
       end
       assert_response :redirect
     end
    
   end

 end

end