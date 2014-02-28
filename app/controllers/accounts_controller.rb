class AccountsController < ApplicationController
  def new
   @account = Account.new
  end

  def create
   @account = AccountService.new(account_params).create
   respond_with @account, location: new_user_registration_url(subdomain: @account.subdomain)
  end

  def account_subdomain_exists
   respond_to do |format|
     format.json { render json: !Account.exists?(account_params) }
   end
  end

  private
  def account_params
    params.require(:account).permit(:company, :subdomain)
  end
end
