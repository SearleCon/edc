class PermittedParams < Struct.new(:params, :current_user)

 # Add allowed params for model here, accessed from application controller via permitted_params method
 def user
   if current_user && current_user.has_role?(:exec)
     params.require(:user).permit(:email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password, :role_ids)
   else
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password, account_attributes: [:company, :subdomain] )
   end
 end

 def note
   params.require(:note).permit(:content).merge(noted_by: current_user.name)
 end

 def role
   params.require(:role).permit(:name)
 end

 def role_permissions
   if current_user && current_user.has_role?(:exec)
    params[:roles] = {} unless params.has_key?(:roles)
    Role.all.each { |role| params[:roles][role.id] = {permission_ids: []} unless params[:roles].has_key?(role.id.to_s) }
    params.require(:roles).permit!
   end
 end
end