class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_category, only: [:edit, :update, :show, :destroy]
  
  def new
    @category  = Category.new
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        flash[:success] = "Category was created successfully."
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update_attributes category_params
        flash[:success] = "Category was updated successfully."
        format.html { redirect_to root_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find params[:id] rescue nil
      return not_found! unless @category
    end


end