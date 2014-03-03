class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.timestamps null: false
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      t.string :name, null: false
      t.string :detail, null: false
      t.integer :user_id, null: false
    end
  end
end
