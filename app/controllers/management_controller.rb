class ManagementController < ApplicationController
  def index
    @users = User.excluding(current_user)
  end
end