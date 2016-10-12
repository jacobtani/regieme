class PagesController < ApplicationController

  def accomodation
    @accomodation = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/accomodation.json")))
  end

  def contact_us
  end

  def cross_off_gift
    respond_to do |format|
      format.html
      format.js
    end
  end

  def faq
    @faqs = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/faq.json")))
  end

  def gift_registry
  end

  def our_story
  end

  def people
    @main_people = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/main_party.json")))
    @bridesmaids_groomsmen = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/bridesmaids_groomsmen.json")))
    @wedding_party = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/wedding_party.json")))
  end

  def the_details
    @the_details = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/the_details.json")))
  end

  def welcome
  end
end
