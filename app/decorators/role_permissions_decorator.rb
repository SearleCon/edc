class RolePermissionsDecorator

  attr_reader :roles, :permissions

  def initialize
    @roles = Role.all.includes(:permissions)
    @permissions = Permission.all
  end
end