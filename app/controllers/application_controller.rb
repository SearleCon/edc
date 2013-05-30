require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  include Ajax

  set_current_tenant_by_subdomain(:account, :subdomain)


  private
  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end

  def after_sign_in_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
