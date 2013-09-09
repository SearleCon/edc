class AccountsController < ApplicationController
  def new
   @account = Account.new
  end

  def create
   @account = AccountService.new(account_params).create
   respond_with @account, location: new_user_registration_url(subdomain: @account.subdomain)
  end

  private
  def account_params
    params.require(:account).permit(:company, :subdomain)
  end
end
