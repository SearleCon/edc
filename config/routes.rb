Edc::Application.routes.draw do



  get "drop_box/authorize"

  get "drop_box/authorize_callback"

  match :latest_alert, to: "alert#latest", via: :get
  match "dismiss_alert/:id", as: :dismiss_alert, to: "dismiss#alert", via: :put

  constraints(Subdomain) do
    root :to => 'home#index'
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => {:passwords => "passwords", :registrations => "registrations"}

  resources :users do
   resources :notes, only: [:index, :new, :create, :destroy]
  end


end