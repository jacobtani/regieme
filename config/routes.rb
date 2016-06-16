Rails.application.routes.draw do

  devise_for :users
  root 'pages#welcome'
  resources :guests
  resources :gifts
  resources :cgs
  resources :messages
  get '/gifts/:id/cross_off_gift' => "gifts#cross_off_gift", as: :cross_off_gift
  get '/messages/send_enquiry' => "messages#send_enquiry", as: :send_enquiry
  resources :rsvps
  controller :pages do
    get :the_details
    get :welcome
    get :our_story
    get :accomodation
    get :people
    get :contact_us
  end

end
