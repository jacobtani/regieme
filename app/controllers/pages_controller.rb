class PagesController < ApplicationController

  def the_details
  end

  def our_story
  end

  def details
  end

  def welcome
  end

  def contact_us
  end

  def faq
    @faqs = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/faq.json")))
  end

  def people
    @main_people = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/main_party.json")))
    @bridesmaids = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/bridesmaids.json")))
    @groomsmen = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/groomsmen.json")))
    @wedding_party = JSON.parse((File.read("#{Rails.root}/app/assets/javascripts/wedding_party.json")))
  end

  def gift_registry
  end

  def cross_off_gift
    respond_to do |format|
      format.html
      format.js
    end
  end

end