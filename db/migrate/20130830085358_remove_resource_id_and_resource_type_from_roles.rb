class RemoveResourceIdAndResourceTypeFromRoles < ActiveRecord::Migration
  def change
    remove_columns :roles, :resource_id, :resource_type
  end
end
