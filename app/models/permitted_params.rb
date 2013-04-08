class PermittedParams < Struct.new(:params, :current_user)

 # Add allowed params for model here, accessed from application controller via permitted_params method
 def user
   if current_user && current_user.has_role?(:admin)
     params.require(:user).permit(:email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password, :role_ids)
   else
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password, account_attributes: [:company, :subdomain] )
   end
 end

 def note
   params[:note].merge!(noted_by: current_user.name)
   params.require(:note).permit(:content, :noted_by)
 end
end