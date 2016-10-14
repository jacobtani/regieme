Rails.application.routes.draw do
  devise_for :users, only: [:sessions]
  resources :guests
  resources :contributions
  resources :messages, only: [:create]

  resources :rsvps
  controller :pages do
    get :wedding_festivities
    get :welcome
    get :our_story
    get :accomodation
    get :people
    get :contact_us
    get :faq
    get :gift_registry
    get :cross_off_gift, as: :cross_off_gift
  end

  match "/401", :to => "errors#missing_authentication", :via => :all
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  get "/messages/send_enquiry" => "messages#send_enquiry", as: :send_enquiry
  get "errors/not_found"
  get "errors/internal_server_error"
  root "pages#welcome"
end
