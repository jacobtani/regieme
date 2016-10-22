class MessagesController < ApplicationController
  before_action :find_guest, only: [:create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    respond_to do |format|
      if @message.valid? && @guest.present?
        SendEnquiryEmail.perform!(guest: @guest, message: @message)
        flash[:notice] = "Message sent! Thank you for contacting us."
        format.html { redirect_to contact_us_path }
      else
        flash[:error] = "Unfortunately your name could not be found in the guest list."
        format.html { redirect_to contact_us_path }
      end
    end
  end

  private

  def find_guest
   @guest_full_name = params[:message][:full_name].split
   @guest = Guest.where("first_name = ? AND surname = ?", @guest_full_name[0], @guest_full_name[1]).first
   @guest.update(email: params[:message][:email]) if @guest
  end

  def message_params
    params.require(:message).permit(:content, :message_subject, :full_name, :email)
  end
end
