Edc::Application.routes.draw do

  resources :roles, except: [:edit, :update, :show]

  scope controller: :drop_box do
   get 'authorize_dropbox'
   get 'confirm_dropbox'
   get 'dropbox_setup_complete'
   get 'setup_dropbox'
  end


  #Alerts
  resources :alert, only: :index
  #get :latest, to: "alert#latest"

  constraints(Subdomain) do
    root to: 'home#index'
  end

  authenticated :user do
    root to: 'home#index'
  end
  root to: "home#index"

  devise_for :users, controllers: {passwords: :passwords, registrations: :registrations}

  resources :users do
   resources :notes, only: [:index, :new, :create, :destroy]
  end

  scope controller: :role_permissions do
    get :edit, as: :permissions_edit
    put :update, as: :permissions_update
  end

  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}


end