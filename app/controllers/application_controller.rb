require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json, :js

  set_current_tenant_by_subdomain(:account, :subdomain)

  protect_from_forgery with: :exception

  layout :has_layout?

  before_action :set_timezone
  before_action :set_mailer_host

  private
  def has_layout?
     false if request.xhr?
  end

  def set_timezone
    Time.zone = current_user.timezone if current_user
  end

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def after_sign_in_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end

  protected
  def devise_parameter_sanitizer
    UserSanitizer.new(User, :user, params)
  end
end
