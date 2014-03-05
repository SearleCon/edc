class UpdateNotableColumnsToCommentableColumns < ActiveRecord::Migration
  def change
    rename_column :comments, :notable_id, :commentable_id
    rename_column :comments, :notable_type, :commentable_type
    remove_columns :comments, :noted_by, :trashed
    add_column :comments, :user_id, :integer
  end
end
