class UserSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name, :email, :password, :password_confirmation)
  end

  def account_update
    default_params.permit(:name, :email, :password, :password_confirmation, :current_password )
  end

  def accept_invitation
    default_params.permit(:name, :timezone,:password, :password_confirmation, :invitation_token)
  end
end

