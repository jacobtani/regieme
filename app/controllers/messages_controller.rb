class MessagesController < ApplicationController
  before_action :find_guest, only: [:create]

  def new
    @message = Message.new
  end

  def create
    binding.pry
    @message = Message.new message_params
    if @message.valid?
      send_message(@guest, @message)
      flash[:success] = "Message sent successfully"
    else
      render "new"
    end
  end

  def send_message(guest, message)
    AdminMailer.send_enquiry(guest, message).deliver_now   
  end

  def confirm_rsvp
  end

  private 

    def find_guest
      @guest = Guest.all.where(first_name: params[:message][:first_name]).first
    end

    def message_params
      params.require(:message).permit(:content, :message_subject, :first_name, :email)
    end

    def set_user
      @user = User.find params[:user_id] rescue nil
      return not_found! unless @user
    end

end