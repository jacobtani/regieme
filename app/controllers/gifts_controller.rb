class GiftsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :cross_off_gift]
  before_action :set_gift, only: [:edit, :update, :show, :destroy, :cross_off_gift]
  
  def index
    @gifts = Gift.all
  end

  def new
    @gift  = Gift.new
  end

  def create
    @gift = Gift.new gift_params
    @gift.remainder_available = params[:gift][:desired_quantity]
    respond_to do |format|
      if @gift.save
        flash[:success] = "Gift was created successfully."
        format.html { redirect_to gifts_path }
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
        format.html { redirect_to gifts_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  def cross_off_gift
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def gift_params
      params.require(:gift).permit(:name, :description, :price, :guest_id, :category_id, :desired_quantity, :remainder_available, :website_link)
    end

    def set_gift
      @gift = Gift.find params[:id]
      return not_found! unless @gift
    end


end