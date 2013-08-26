class UserSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name,:time_zone, :email, :password, :password_confirmation, account_attributes: [:company, :subdomain] )
  end

  def account_update
    default_params.permit(:name,:time_zone, :email, :password, :password_confirmation, :current_password, account_attributes: [:company, :subdomain] )
  end


end

