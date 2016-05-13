class GiftsController < ApplicationController
  before_action :set_gift, only: [:edit, :update, :show, :destroy]
  
  def index
    @guests = Gift.all
  end

  def new
    @guest  = Gift.new
  end

  def create
    @gift = Gift.new gift_params
    respond_to do |format|
      if @gift.save
        flash[:success] = "Gift was created successfully."
        format.html { redirect_to admin_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @gift.update_attributes gift_params
        flash[:success] = "Gift was updated successfully."
        format.html { redirect_to admin_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gift.destroy
    redirect_to admin_path
  end

  private

    def gift_params
      params.require(:gift).permit(:caption, :description, :price, :shop_name, :guest_id)
    end

    def set_gift
      @gift = Gift.find params[:id] rescue nil
      return not_found! unless @gift
    end


end