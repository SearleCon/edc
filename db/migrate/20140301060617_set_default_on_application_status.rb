class SetDefaultOnApplicationStatus < ActiveRecord::Migration
  def change
    change_column :applications, :status, :integer, default: 0
  end
end
