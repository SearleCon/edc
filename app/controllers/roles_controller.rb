class RolesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!
  before_action :new_resource, only: [:new, :create]
  before_action :get_resource, only: [:destroy]


  def index
   @roles = RoleDecorator.build_collection(Role.exclude(:admin, current_user.role_name))
  end

  def new
  end

  def create
    @role.save
    respond_with(@role, location: role_permissions_edit_url)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private
  def role_params
    params.require(:role).permit(:name) if params[:role]
  end

  def new_resource
    @role = Role.new(role_params)
  end

  def get_resource
    @role = Role.find(params[:id])
  end


  def interpolation_options
    { resource_name: @role.name }
  end

end
