class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :company
      t.string :subdomain

      t.timestamps
    end
  end
end
