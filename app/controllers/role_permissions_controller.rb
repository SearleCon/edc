class RolePermissionsController < ApplicationController
  before_filter :authenticate_user!


  def edit
    @roles = Role.all
    @permissions = Permission.all
    authorize! :read, Permission
    authorize! :read, Role
  end

  def update
    authorize! :update, Role
    @roles = Role.update(role_permissions_params.keys, role_permissions_params.values)
    @roles.reject! { |r| r.errors.empty? }
    if @roles.empty?
      flash[:notice] = 'Rights have been updated successfully.'
      redirect_to permissions_edit_url
    else
      render 'role_permissions/edit'
    end

  end

  def role_permissions_params
    permitted_params.role_permissions
  end
end
