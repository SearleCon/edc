class AddAccountIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :account_id, :integer
  end
end
