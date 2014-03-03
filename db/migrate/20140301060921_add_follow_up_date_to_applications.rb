class AddFollowUpDateToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :follow_up_date, :date
  end
end
