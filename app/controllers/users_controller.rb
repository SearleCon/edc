class UsersController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!
  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    password = Devise.friendly_token.first(8)
    @user.password = password
    RegisterUserJob.new.async.perform(@user, password) if @user.save
    respond_with @user, location: management_url
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
      params.require(:user).permit(:name, :email, :role_id)
    end
end