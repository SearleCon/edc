class UsersController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!

  load_and_authorize_resource :user, message: 'Not authorized to change user details.'

  def index
    @users = User.exclude(current_user)
  end


  def update
    @user.update(user_params)
    respond_with(@user, location: users_path)
  end
    
  def destroy
    @user.destroy
    respond_with(@user)
  end

  def user_params
    permitted_params.user
  end
end