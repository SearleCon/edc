Edc::Application.routes.draw do

  concern :notable do
    resources :notes, only: [:index, :new, :create, :destroy]
  end

  constraints(Subdomain) do
    root :to => 'home#index'
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => {:passwords => "passwords", :registrations => "registrations"}

  resources :users, concerns: :notable

  match "*path", :to => "application#routing_error"
end