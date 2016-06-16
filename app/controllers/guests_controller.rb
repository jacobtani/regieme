class GuestsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_guest, only: [:edit, :update, :show, :destroy]
  
  def index
    @guests = Guest.all
  end

  def new
    @guest  = Guest.new
  end

  def create
    @guest = Guest.new guest_params
    respond_to do |format|
      if @guest.save
        flash[:success] = "Guest was created successfully."
        format.html { redirect_to guests_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @guest.update_attributes guest_params
        flash[:success] = "Guest was updated successfully."
        format.html { redirect_to guests_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_path
  end

  def send_enquiry 
    AdminMailer.send_enquiry(@guest).deliver
  end

  private

    def guest_params
      params.require(:guest).permit(:first_name, :surname, :address)
    end

    def set_guest
      @guest = Guest.find params[:id] rescue nil
      return not_found! unless @guest
    end

    def find_guest
      @guest_full_name = params[:rsvp][:full_name].split
      @guest=Guest.all.where(first_name: @guest_full_name[0], surname: @guest_full_name[1]).first
    end

end