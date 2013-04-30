Edc::Application.routes.draw do


  scope controller: :drop_box do
   get "authorize_dropbox"
   get 'confirm_dropbox'
   get 'dropbox_setup_complete'
   get 'setup_dropbox'
  end

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