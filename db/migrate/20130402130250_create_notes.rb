class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :notable_id
      t.string :notable_type

      t.timestamps
    end

    add_index :notes, [:notable_id, :notable_type]

  end
end
