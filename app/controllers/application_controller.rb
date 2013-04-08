class ApplicationController < ActionController::Base
  protect_from_forgery
  include Ajax

  set_current_tenant_by_subdomain(:account, :subdomain)



  # CanCan Exception Handler
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # Handle routing errors
  rescue_from ActionController::RoutingError, :with => :render_not_found

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def render_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

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
