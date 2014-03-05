class ApplicationController < ActionController::Base
  include Pundit
  respond_to :html, :json, :js

  protect_from_forgery with: :exception

  layout :has_layout?


  def after_sign_up_path_for(resource_or_scope)
    root_url
  end

  def after_sign_in_path_for(resource_or_scope)
    root_url
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end


  private
  def has_layout?
    false if request.xhr?
  end


  protected
  def devise_parameter_sanitizer
    Devise::Sanitizers::UserSanitizer.new(User, :user, params)
  end
end
