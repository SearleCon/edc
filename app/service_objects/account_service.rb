class AccountService
  DEFAULT_ROLES = %w(admin exec user)

  def initialize(account_params)
    @account = Account.new(account_params)
  end

  def create
    Account.transaction { raise ActiveRecord::Rollback unless @account.save && create_roles }
    @account
  end

  private
   def create_roles
    DEFAULT_ROLES.each { |role| Role.create!(name: role, account: @account) }
   end
end