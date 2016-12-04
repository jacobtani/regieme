class PagesController < ApplicationController

  def accomodation
    @accomodation = JSON.parse((File.read("#{Rails.root}/public/json/accomodation.json")))
  end

  def contact_us
  end

  def faq
    @faqs = JSON.parse((File.read("#{Rails.root}/public/json/faq.json")))
  end

  def gift_registry
  end

  def our_story
    @our_story_events = JSON.parse((File.read("#{Rails.root}/public/json/our_story.json")))
  end

  def people
    @main_people = JSON.parse((File.read("#{Rails.root}/public/json/main_party.json")))
    @bridesmaids_groomsmen = JSON.parse((File.read("#{Rails.root}/public/json/bridesmaids_groomsmen.json")))
    @wedding_party = JSON.parse((File.read("#{Rails.root}/public/json/wedding_party.json")))
  end

  def info
    @info = JSON.parse((File.read("#{Rails.root}/public/json/info.json")))
  end

  def welcome
  end
end
