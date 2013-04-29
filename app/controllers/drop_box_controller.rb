class DropBoxController < ApplicationController
  def authorize
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    session[:request_token] = consumer.get_request_token
    redirect_to session[:request_token].authorize_url(:oauth_callback => drop_box_authorize_callback_url)
  end

  def authorize_callback
    access = session.delete(:request_token).get_access_token(:oauth_verifier => params[:oauth_token])
    current_user.drop_box_key = access.token
    current_user.drop_box_secret = access.secret
    current_user.save!
    redirect_to root_url
  end
end
