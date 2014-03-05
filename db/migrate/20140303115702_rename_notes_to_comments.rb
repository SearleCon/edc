class RenameNotesToComments < ActiveRecord::Migration
  def change
    rename_table :notes, :comments
  end
end
