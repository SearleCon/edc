class AddNotedByToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :noted_by, :string
  end
end
