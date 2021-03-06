class RsvpsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :index, :update, :edit]
  before_action :set_rsvp, only: [:edit, :update, :show, :destroy]

  def index
    @rsvps = Rsvp.order(:id)
  end

  def new
    @rsvp  = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new rsvp_params
    respond_to do |format|
      if @rsvp.save
        SendRsvpEmails.perform!(rsvp: @rsvp)
        flash[:success] = "Thank you for RSVPing #{@rsvp.guest_name}! Please RSVP for other members of your party/group individually if you haven't already done so."
        format.html { redirect_to :action => 'new' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @rsvp.update_attributes rsvp_params
        flash[:success] = "Rsvp was updated successfully."
        format.html { redirect_to rsvps_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @rsvp.destroy
    redirect_to rsvps_path
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:guest_name, :email, :attending, :main_meal_preference, :dessert_preference, :dietary_requirements)
  end

  def set_rsvp
    @rsvp = Rsvp.find params[:id]
    return not_found! unless @rsvp
  end
end
