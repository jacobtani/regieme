Rails.application.routes.draw do

  devise_for :users
  root 'pages#welcome'
  resources :guests
  resources :gifts
  resources :cgs
  get '/gifts/:id/cross_off_gift' => "gifts#cross_off_gift", as: :cross_off_gift
  resources :rsvps
  controller :pages do
    get :the_details
    get :welcome
    get :our_story
  end

end
