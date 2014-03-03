class AddProgrammeIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :programme_id, :integer
  end
end
