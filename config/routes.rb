Rails.application.routes.draw do

  root 'pages#welcome'
  resources :guests
  resources :gifts
  controller :pages do
    get :the_details
    get :welcome
  end

end
