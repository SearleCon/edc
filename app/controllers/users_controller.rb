class UsersController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!
  before_action :set_user, only: [:update, :destroy]


  def index
    @users = User.all
  end



  def update
    authorize @user
    @user.update(user_params)
    respond_with(@user, location: users_path)
  end
    
  def destroy
    authorize @user
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      permitted_params.user
    end
end