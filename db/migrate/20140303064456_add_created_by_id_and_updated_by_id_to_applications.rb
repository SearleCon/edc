class AddCreatedByIdAndUpdatedByIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :created_by_id, :integer
    add_column :applications, :updated_by_id, :integer
  end
end
