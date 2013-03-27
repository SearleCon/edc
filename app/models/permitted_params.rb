class PermittedParams < Struct.new(:params, :current_user)

 # Add allowed params for model here, accessed from application controller via permitted_params method
 def user
   if current_user.has_role? :admin
     params.require(:user).permit(:email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password, :role_ids)
   else
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :reset_password_token, :remember_me, :current_password)
  end
 end

end