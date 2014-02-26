class AddCreatedByAndUpdatedByToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :created_by_id, :integer
    add_column :customers, :updated_by_id, :integer
  end
end
