Rails.application.routes.draw do

  devise_for :users
  root 'pages#welcome'
  resources :guests
  resources :gifts
  resources :rsvps
  controller :pages do
    get :the_details
    get :welcome
  end

end
