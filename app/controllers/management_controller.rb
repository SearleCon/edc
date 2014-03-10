class ManagementController < ApplicationController
  def index
    @users = User.exclude(current_user)
  end
end