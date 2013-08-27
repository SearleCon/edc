class RolePermissionsController < ApplicationController
  before_action :authenticate_user!


  def edit
    @role_permissions = RolePermissionsDecorator.new
    authorize! :manage, RolePermission
  end

  def update
    authorize! :update, RolePermission
    if (Role.update(role_permissions_params.keys, role_permissions_params.values).reject! { |r| r.errors.empty? }).empty?
      flash[:notice] = 'Roles were updated successfully.'
    else
      flash[:alert] = 'An error occured while updating the roles.'
    end
    redirect_to permissions_edit_url
  end

  def role_permissions_params
      params[:roles] = {} unless params.has_key?(:roles)
      Role.all.each { |role| params[:roles][role.id] = {permission_ids: []} unless params[:roles].has_key?(role.id.to_s) }
      params.require(:roles).permit!
  end
end
