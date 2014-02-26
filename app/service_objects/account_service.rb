class AccountService
  DEFAULT_ROLES = %w(admin exec user)

  def initialize(account_params)
    @account = Account.new(account_params)
  end

  def create
   if @account.valid?
    Account.transaction do
      @account.save!
      create_roles!
    end
   end
   @account
  end

  private
   def create_roles!
    DEFAULT_ROLES.each { |role| Role.create!(name: role, account: @account) }
   end
end