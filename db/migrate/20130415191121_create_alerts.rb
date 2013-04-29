class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :content
      t.boolean :active

      t.timestamps
    end
  end
end
