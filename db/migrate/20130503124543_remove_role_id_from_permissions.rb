class RemoveRoleIdFromPermissions < ActiveRecord::Migration
 def change
   remove_column :permissions, :role_id
 end
end