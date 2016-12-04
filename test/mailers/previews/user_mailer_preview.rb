class UserMailerPreview < ActionMailer::Preview

  def rsvp_confirmation_preview
    rsvp = Rsvp.create(guest_name: "Guest User", attending: "Yes", main_meal_preference: "chicken", dessert_preference: "creme", email: "user@gmail.com")
    UserMailer.rsvp_confirmation(rsvp: rsvp)
  end
end
