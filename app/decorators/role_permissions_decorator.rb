class RolePermissionsDecorator

  attr_reader :roles, :permissions

  def initialize(*args)
    options = args.extract_options!
    @roles = options[:roles]
    @permissions = options[:permissions]
  end
end