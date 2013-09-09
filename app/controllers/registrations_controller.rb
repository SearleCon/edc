class RegistrationsController < Devise::RegistrationsController

  def new
   resource = build_resource(role: default_role)
   respond_with resource
  end

  private
  def default_role
    Role.find_by(name: :exec)
  end

  protected
  def after_sign_up_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

end