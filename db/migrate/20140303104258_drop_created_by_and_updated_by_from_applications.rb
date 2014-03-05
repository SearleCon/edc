class DropCreatedByAndUpdatedByFromApplications < ActiveRecord::Migration
  def change
    remove_columns :applications, :created_by_id, :updated_by_id
  end
end
