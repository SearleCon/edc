class RegistrationsController < Devise::RegistrationsController

  def new
   resource = build_resource(account: current_tenant)
   respond_with resource
  end

  def create
    build_resource(sign_up_params)

    if resource.save && AccountSetup.new(resource.account).setup

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected
  def after_sign_up_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

end