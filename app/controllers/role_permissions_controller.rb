class RolePermissionsController < ApplicationController
  before_filter :authenticate_user!


  def edit
    @role_permissions = RolePermissionsDecorator.new
    authorize! :manage, RolePermission
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
      params[:roles] = {} unless params.has_key?(:roles)
      Role.all.each { |role| params[:roles][role.id] = {permission_ids: []} unless params[:roles].has_key?(role.id.to_s) }
      params.require(:roles).permit!
  end
end
