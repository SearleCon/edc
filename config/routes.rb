Edc::Application.routes.draw do
  # Concerns
  concern :commentable do |options|
    resources :comments, options
  end

  concern :trackable do
    resources :activities, only: :index
  end

  resources :accounts, only: [:new, :create]
  match 'account_subdomain_exists', to: 'accounts#account_subdomain_exists', via: :get

  resources :roles, except: [:edit, :update, :show]

  namespace :dropbox do
    get :authorize
    get :confirm
    get :setup_complete
    get :setup
  end

  #Alerts
  resources :alerts, only: [:index, :destroy]

  match 'management', to: 'management#index', via: :get
  resources :customers, except: [:new, :create], concerns: [:commentable, :trackable]

  authenticated :user do
    root to: 'high_voltage/pages#show', id: 'home', as: :authenticated_root
  end

  devise_for :users, controllers: {registrations: :registrations}

  scope '/manage' do
   resources :users, only: [:new, :create, :destroy]
  end

  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}, via: :all

end
#== Route Map
# Generated on 02 Apr 2014 09:42
#
#                 accounts POST   /accounts(.:format)                                 accounts#create
#              new_account GET    /accounts/new(.:format)                             accounts#new
# account_subdomain_exists GET    /account_subdomain_exists(.:format)                 accounts#account_subdomain_exists
#                    roles GET    /roles(.:format)                                    roles#index
#                          POST   /roles(.:format)                                    roles#create
#                 new_role GET    /roles/new(.:format)                                roles#new
#                     role DELETE /roles/:id(.:format)                                roles#destroy
#        dropbox_authorize GET    /dropbox/authorize(.:format)                        dropbox#authorize
#          dropbox_confirm GET    /dropbox/confirm(.:format)                          dropbox#confirm
#   dropbox_setup_complete GET    /dropbox/setup_complete(.:format)                   dropbox#setup_complete
#            dropbox_setup GET    /dropbox/setup(.:format)                            dropbox#setup
#                   alerts GET    /alerts(.:format)                                   alerts#index
#                    alert DELETE /alerts/:id(.:format)                               alerts#destroy
#               management GET    /management(.:format)                               management#index
#        customer_comments GET    /customers/:customer_id/comments(.:format)          comments#index
#                          POST   /customers/:customer_id/comments(.:format)          comments#create
#     new_customer_comment GET    /customers/:customer_id/comments/new(.:format)      comments#new
#    edit_customer_comment GET    /customers/:customer_id/comments/:id/edit(.:format) comments#edit
#         customer_comment GET    /customers/:customer_id/comments/:id(.:format)      comments#show
#                          PATCH  /customers/:customer_id/comments/:id(.:format)      comments#update
#                          PUT    /customers/:customer_id/comments/:id(.:format)      comments#update
#                          DELETE /customers/:customer_id/comments/:id(.:format)      comments#destroy
#      customer_activities GET    /customers/:customer_id/activities(.:format)        activities#index
#                customers GET    /customers(.:format)                                customers#index
#            edit_customer GET    /customers/:id/edit(.:format)                       customers#edit
#                 customer GET    /customers/:id(.:format)                            customers#show
#                          PATCH  /customers/:id(.:format)                            customers#update
#                          PUT    /customers/:id(.:format)                            customers#update
#                          DELETE /customers/:id(.:format)                            customers#destroy
#       authenticated_root GET    /                                                   high_voltage/pages#show {:id=>"home"}
#         new_user_session GET    /users/sign_in(.:format)                            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                           devise/sessions#destroy
#            user_password POST   /users/password(.:format)                           devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                      devise/passwords#edit
#                          PATCH  /users/password(.:format)                           devise/passwords#update
#                          PUT    /users/password(.:format)                           devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                             registrations#cancel
#        user_registration POST   /users(.:format)                                    registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                            registrations#new
#   edit_user_registration GET    /users/edit(.:format)                               registrations#edit
#                          PATCH  /users(.:format)                                    registrations#update
#                          PUT    /users(.:format)                                    registrations#update
#                          DELETE /users(.:format)                                    registrations#destroy
#                    users POST   /manage/users(.:format)                             users#create
#                 new_user GET    /manage/users/new(.:format)                         users#new
#                     user DELETE /manage/users/:id(.:format)                         users#destroy
#                                 (/errors)/:status(.:format)                         errors#show {:status=>/\d{3}/}
#                     home GET    /home(.:format)                                     redirect(301, /)
#                     root GET    /                                                   high_voltage/pages#show {:id=>"home"}
#                     page GET    /*id                                                high_voltage/pages#show
