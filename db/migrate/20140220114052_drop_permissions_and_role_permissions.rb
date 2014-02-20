class DropPermissionsAndRolePermissions < ActiveRecord::Migration
  def change
    drop_table :permissions
    drop_table :role_permissions
  end
end
