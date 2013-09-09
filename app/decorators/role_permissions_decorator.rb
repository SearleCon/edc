class RolePermissionsDecorator

  attr_reader :roles, :permissions

  def initialize(*args)
    options = args.extract_options!
    @roles = RoleDecorator.build_collection(options[:roles])
    @permissions = PermissionDecorator.build_collection(options[:permissions])
  end
end