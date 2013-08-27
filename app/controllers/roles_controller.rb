class RolesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!
  before_action :new_resource, only: [:new, :create]
  before_action :get_resource, only: [:destroy]


  def index
   authorize! :read, Role
   @roles = Role.all
  end

  def new
  end

  def create
    authorize! :modify, Role
    flash[:notice] = "Role #{@role.name} created successfully." if @role.save
    respond_with(@role, location: permissions_edit_url)
  end

  def destroy
    @role.destroy
    flash[:notice] = "Role #{@role.name} was destroyed successfully" if @role.destroyed?
    respond_with(@role)
  end

  private
  def role_params
    permitted_params.role if params[:role]
  end

  def new_resource
    @role = Role.new(role_params)
  end

  def get_resource
    @role = Role.find(params[:id])
  end

end
