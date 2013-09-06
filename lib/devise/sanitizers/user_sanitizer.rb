class UserSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name,:timezone, :email, :password, :password_confirmation, :role_id, account_attributes: [:company, :subdomain, :id] )
  end

  def account_update
    default_params.permit(:name,:timezone, :email, :password, :password_confirmation, :current_password, account_attributes: [:company, :subdomain, :id] )
  end

  def accept_invitation
    default_params.permit(:name, :timezone,:password, :password_confirmation, :invitation_token)
  end
end

