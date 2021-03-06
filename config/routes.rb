Rails.application.routes.draw do
  devise_for :users, only: [:sessions]
  resources :messages, only: [:create]

  resources :rsvps
  controller :pages do
    get :info
    get :welcome
    get :our_story
    get :accomodation
    get :people
    get :contact_us
    get :faq
    get :gift_registry
  end

  get "/401", :to => "errors#missing_authentication"
  get "/404", :to => "errors#not_found"
  get "/500", :to => "errors#internal_server_error"
  get "/messages/send_enquiry" => "messages#send_enquiry", as: :send_enquiry
  get "errors/not_found"
  get "errors/internal_server_error"
  root "pages#welcome"
end
