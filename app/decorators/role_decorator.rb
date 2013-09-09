class RoleDecorator

  def self.build_collection(roles)
    roles.map {|role| new(role)}
  end


  attr_reader :role, :permissions

  def initialize(role)
    @role = role
    @permissions = PermissionDecorator.build_collection(role.permissions)
  end

  def name
    role.name.titleize
  end

  def method_missing(method_name, *args, &block)
    role.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    role.respond_to?(method_name, include_private) || super
  end
end