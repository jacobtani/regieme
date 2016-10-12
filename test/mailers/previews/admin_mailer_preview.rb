class AdminMailerPreview < ActionMailer::Preview

  def send_enquiry_preview
    guest = Guest.create(first_name: "user", surname: "yo", address: "address", age_category: "adult", email: "user@gmail.com")
    AdminMailer.send_enquiry(guest: guest, message: "HI")
  end

  def rsvp_confirmation_preview
    guest = Guest.create(first_name: "user", surname: "yo", address: "address", age_category: "adult", email: "user@gmail.com")
    rsvp = Rsvp.create(guest_id: guest.id, attending: "Yes", main_meal_preference: "chicken", dessert_preference: "creme", email: "user@gmail.com")
    AdminMailer.rsvp_confirmation(guest: guest, rsvp: rsvp)
  end
end
