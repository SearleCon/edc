class UsersController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!

  load_and_authorize_resource :user, message: 'Not authorized as an administrator.'

  def index
    @users = User.where.not(id: current_user)
  end


  def update
    flash[:notice] = "#{@user.name} was updated successfully" if @user.update_attributes(user_params)
    respond_with(@user, location: users_path)
  end
    
  def destroy
    if @user == current_user
      redirect_to users_path, notice: "Can't delete yourself."
    else
      @user.destroy
      redirect_to users_path, notice: "User deleted."
    end
  end

  def user_params
    permitted_params.user
  end
end