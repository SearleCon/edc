class RegistrationsController < Devise::RegistrationsController

  def new
   resource = build_resource({})
   resource.initialize_addresses
   resource.build_account
   respond_with resource
  end


  def resource_params
    permitted_params.user
  end
  private :resource_params

  protected
  def after_sign_up_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

end