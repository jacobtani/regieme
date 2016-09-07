class CgsController < ApplicationController
  before_action :set_cg, only: [:destroy]
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @cgs = Cg.all
  end

  def new
    @cg  = Cg.new
  end

  def create
    @cg = Cg.new cg_params
    respond_to do |format|
      if @cg.save
        AdminMailer.gift_crossed(@cg).deliver_now
        flash.now[:success] = "Thank you for your generosity in contributing towards our honeymoon."
        format.html { redirect_to gift_registry_path }
      else
        flash[:error] = "Unable to save contribution details as you did not provide guest names. Please try again"
        format.html { redirect_to gift_registry_path }
      end
    end
  end

  def destroy
    @cg.destroy
    redirect_to cgs_path
  end

  private

  def cg_params
    params.require(:cg).permit(:guest_names, :contribution_amount)
  end

  def set_cg
    @cg = Cg.find params[:id] rescue nil
  end
end