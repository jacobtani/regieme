class RsvpsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_rsvp, only: [:edit, :update, :show, :destroy]
  before_action :find_guest, only: [:create]

  def index
    @rsvps = Rsvp.all
  end

  def new
    @rsvp  = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new rsvp_params
    @rsvp.guest_id = @guest.id if @guest.present?
    respond_to do |format|
      if @rsvp.save
        flash[:success] = "Rsvp was created successfully."
        format.html { redirect_to rsvps_path }
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
      params.require(:rsvp).permit(:guest_id, :attending, :meal_preference, :dietary_requirements, :first_name, :surname)
    end

    def find_guest
      @guest=Guest.all.where(first_name: params[:rsvp][:first_name], surname: params[:rsvp][:surname]).first
    end
    
    def set_rsvp
      @rsvp = Rsvp.find params[:id] rescue nil
      return not_found! unless @rsvp
    end


end