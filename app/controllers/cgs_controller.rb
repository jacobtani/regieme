class CgsController < ApplicationController
  before_action :set_cg, only: [:destroy]
  before_action :set_gift, only: [:create]
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @cgs = Cg.all
  end

  def new
    @cg  = Cg.new
  end

  def create
    @cg = Cg.new cg_params
    @gift.decrement!(:remainder_available)
    respond_to do |format|
      if @cg.save
        flash[:success] = "#{@gift.name} was crossed off successfully."
        format.html { redirect_to gifts_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @gift = Gift.find(@cg.gift_id)
    @gift.increment!(:remainder_available)
    @cg.destroy
    redirect_to cgs_path
  end

  private

    def cg_params
      params.require(:cg).permit(:guest_names, :item_name, :gift_id)
    end

    def set_cg
      @cg = Cg.find params[:id] rescue nil
      return not_found! unless @cg
    end

    def set_gift
      @gift = Gift.find params[:cg][:gift_id] rescue nil
      return not_found! unless @gift
    end

end