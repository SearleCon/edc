class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.datetime :application_date
      t.integer :status
      t.references :customer
      t.timestamps
    end
  end
end
