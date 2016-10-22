class RsvpsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_rsvp, only: [:edit, :update, :show, :destroy]
  before_action :find_guest, only: [:create]

  def index
    @rsvps = Rsvp.order(:id)
  end

  def new
    @rsvp  = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new rsvp_params
    @rsvp.guest_id = @guest.id if @guest.present?
    respond_to do |format|
      if @rsvp.save
        @guest.update(email: @rsvp.email)
        SendRsvpEmails.perform!(rsvp: @rsvp, guest: @guest)
        format.html { render :new }
        flash.now[:success] = "Thank you for RSVPing #{@guest.first_name}! Would you like to RSVP for more guests?"
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
    params.require(:rsvp).permit(:guest_id, :email, :attending, :main_meal_preference, :dessert_preference, :dietary_requirements, :full_name)
  end

  def find_guest
    @guest_full_name = params[:rsvp][:full_name].split
    @guest = Guest.where("first_name = ? AND surname = ?", @guest_full_name[0], @guest_full_name[1]).first
  end

  def set_rsvp
    @rsvp = Rsvp.find params[:id]
    return not_found! unless @rsvp
  end
end
