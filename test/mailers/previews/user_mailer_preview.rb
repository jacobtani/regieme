class UserMailerPreview < ActionMailer::Preview

  def rsvp_confirmation_preview
    guest = Guest.create(first_name: "user", surname: "yo", address: "address", age_category: "adult", email: "user@gmail.com")
    rsvp = Rsvp.create(guest_id: guest.id, attending: "Yes", main_meal_preference: "chicken", dessert_preference: "creme", email: "user@gmail.com")
    UserMailer.rsvp_confirmation(guest: guest, rsvp: rsvp)
  end
end
