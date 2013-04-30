class AddDropBoxKeyAndDropBoxSecretToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :drop_box_key, :string
    add_column :accounts, :drop_box_secret, :string
  end
end
