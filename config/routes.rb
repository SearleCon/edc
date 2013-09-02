Edc::Application.routes.draw do

  # Concerns
  concern :notable do |options|
    resources :notes, options
  end

  resources :roles, except: [:edit, :update, :show]

  namespace :dropbox do
    get :authorize
    get :confirm
    get :setup_complete
    get :setup
  end

  #Alerts
  resources :alerts, only: [:index, :destroy]


  constraints(Subdomain) do
    root to: 'home#index', as: :home
  end

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: "home#index"

  devise_for :users, controllers: {registrations: :registrations}

  resources :users, concerns: :notable

  namespace :role_permissions do
    get :edit
    patch :update
  end

  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}, via: :all


end
#== Route Map
# Generated on 02 Sep 2013 08:16
#
#                    roles GET    /roles(.:format)                         roles#index
#                          POST   /roles(.:format)                         roles#create
#                 new_role GET    /roles/new(.:format)                     roles#new
#                     role DELETE /roles/:id(.:format)                     roles#destroy
#        dropbox_authorize GET    /dropbox/authorize(.:format)             dropbox#authorize
#          dropbox_confirm GET    /dropbox/confirm(.:format)               dropbox#confirm
#   dropbox_setup_complete GET    /dropbox/setup_complete(.:format)        dropbox#setup_complete
#            dropbox_setup GET    /dropbox/setup(.:format)                 dropbox#setup
#                   alerts GET    /alerts(.:format)                        alerts#index
#                     home GET    /                                        home#index
#       authenticated_root GET    /                                        home#index
#                     root GET    /                                        home#index
#         new_user_session GET    /users/sign_in(.:format)                 devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                devise/sessions#destroy
#            user_password POST   /users/password(.:format)                devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#                          PATCH  /users/password(.:format)                devise/passwords#update
#                          PUT    /users/password(.:format)                devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                  registrations#cancel
#        user_registration POST   /users(.:format)                         registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                 registrations#new
#   edit_user_registration GET    /users/edit(.:format)                    registrations#edit
#                          PATCH  /users(.:format)                         registrations#update
#                          PUT    /users(.:format)                         registrations#update
#                          DELETE /users(.:format)                         registrations#destroy
#               user_notes GET    /users/:user_id/notes(.:format)          notes#index
#                          POST   /users/:user_id/notes(.:format)          notes#create
#            new_user_note GET    /users/:user_id/notes/new(.:format)      notes#new
#           edit_user_note GET    /users/:user_id/notes/:id/edit(.:format) notes#edit
#                user_note GET    /users/:user_id/notes/:id(.:format)      notes#show
#                          PATCH  /users/:user_id/notes/:id(.:format)      notes#update
#                          PUT    /users/:user_id/notes/:id(.:format)      notes#update
#                          DELETE /users/:user_id/notes/:id(.:format)      notes#destroy
#                    users GET    /users(.:format)                         users#index
#                          POST   /users(.:format)                         users#create
#                 new_user GET    /users/new(.:format)                     users#new
#                edit_user GET    /users/:id/edit(.:format)                users#edit
#                     user GET    /users/:id(.:format)                     users#show
#                          PATCH  /users/:id(.:format)                     users#update
#                          PUT    /users/:id(.:format)                     users#update
#                          DELETE /users/:id(.:format)                     users#destroy
#    role_permissions_edit GET    /role_permissions/edit(.:format)         role_permissions#edit
#  role_permissions_update PATCH  /role_permissions/update(.:format)       role_permissions#update
#                                 (/errors)/:status(.:format)              errors#show {:status=>/\d{3}/}
