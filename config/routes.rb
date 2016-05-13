Rails.application.routes.draw do

  root 'pages#about_us'
  resources :guests

  controller :pages do
    get :about_us
  end

end
