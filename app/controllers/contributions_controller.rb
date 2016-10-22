class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:destroy]
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @contributions = Contribution.order("id")
  end

  def new
    @contribution  = Contribution.new
  end

  def create
    @contribution = Contribution.new contribution_params
    respond_to do |format|
      if @contribution.save
        SendGiftContributedEmail.perform!(contribution: @contribution)
        flash.now[:success] = "Thank you for your generosity in contributing towards our honeymoon."
        format.html { redirect_to gift_registry_path }
      else
        flash[:error] = "Unable to save contribution details as you did not provide guest names. Please try again"
        format.html { redirect_to gift_registry_path }
      end
    end
  end

  def destroy
    @contribution.destroy
    redirect_to contributions_path
  end

  private

  def contribution_params
    params.require(:contribution).permit(:guest_names, :contribution_amount)
  end

  def set_contribution
    @contribution = Contribution.find params[:id]
  end
end
