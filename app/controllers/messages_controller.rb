class MessagesController < ApplicationController
  before_action :find_guest, only: [:create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.valid?
      AdminMailer.send_enquiry(@guest, @message).deliver_now if @guest.email != '""'
      flash[:success] = "Message has been successfully sent to Iain & Tania"
      redirect_to contact_us_path
    else
      render "new"
    end
  end

  private 

    def find_guest
      @guest = Guest.where("email = ?", params[:message][:email]).first
    end

    def message_params
      params.require(:message).permit(:content, :message_subject, :email)
    end

end