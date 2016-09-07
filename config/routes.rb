Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :users
  root 'pages#welcome'
  resources :guests
  resources :categories
  resources :cgs
  resources :messages
# get '/cross_off_gift' => "gifts#cross_off_gift", as: :cross_off_gift
  get '/messages/send_enquiry' => "messages#send_enquiry", as: :send_enquiry
  resources :rsvps
  controller :pages do
    get :the_details
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

end
