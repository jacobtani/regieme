class AdminMailerPreview < ActionMailer::Preview

  def send_enquiry_preview
    AdminMailer.send_enquiry(message: "HI")
  end

  def rsvp_confirmation_preview
    rsvp = Rsvp.create(guest_id: "Test User", attending: "Yes", main_meal_preference: "chicken", dessert_preference: "creme", email: "user@gmail.com")
    AdminMailer.rsvp_confirmation(rsvp: rsvp)
  end
end
