class MessagesController < ApplicationController
  before_action :find_guest, only: [:create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.valid?
      SendEnquiryEmail.perform!(guest: @guest, message: @message)
      flash[:notice] = "Message sent! Thank you for contacting us."
      redirect_to contact_us_path
    else
      render "new"
    end
  end

  private

  def find_guest
   @guest_full_name = params[:message][:full_name].split
   @guest = Guest.where("first_name = ? AND surname = ?", @guest_full_name[0], @guest_full_name[1]).first

   if @guest.email == "NULL"
      @guest.update(email: params[:message][:email])
   end
  end

  def message_params
    params.require(:message).permit(:content, :message_subject, :full_name, :email)
  end
end
