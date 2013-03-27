class ApplicationController < ActionController::Base
  protect_from_forgery
  include Ajax

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
end
