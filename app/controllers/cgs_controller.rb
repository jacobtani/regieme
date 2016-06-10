class CgsController < ApplicationController
  before_action :set_cg, only: [:edit, :update, :show, :destroy]
  before_action :find_gift, only: [:create]

  def index
    @cgs = Cg.all
  end

  def new
    @cg  = Cg.new
    render layout: 'modal'
  end

  def create
    @cg = Cg.new cg_params
    binding.pry
    respond_to do |format|
      if @cg.save
        @remainder_gifts = @gift.remainder_available - 1
        @gift.update_attributes(remainder_available: @remainder_gifts)
        flash[:success] = "Cg was created successfully."
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
      if @cg.update_attributes cg_params
        flash[:success] = "Cg was updated successfully."
        format.html { redirect_to gifts_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cg.destroy
    redirect_to gifts_path
  end

  private

    def cg_params
      params.require(:cg).permit(:guest_names, :item_name)
    end

    def set_cg
      @cg = Cg.find params[:id] rescue nil
      return not_found! unless @cg
    end

    def find_gift
      @gift = Gift.find params[:cg][:gift_id] rescue nil
    end


end