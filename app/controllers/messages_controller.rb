class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    respond_to do |format|
      if @message.valid?
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

  def message_params
    params.require(:message).permit(:content, :message_subject, :full_name, :email)
  end
end
