class DropCreatedByAndUpdatedByFromCustomers < ActiveRecord::Migration
  def change
    remove_columns :customers, :created_by_id, :updated_by_id
  end
end
