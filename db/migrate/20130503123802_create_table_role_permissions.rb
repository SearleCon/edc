class CreateTableRolePermissions < ActiveRecord::Migration
 def change
   create_table :role_permissions do |t|
     t.column :role_id, :integer
     t.column :permission_id, :integer
     t.timestamps
   end
 end
end
