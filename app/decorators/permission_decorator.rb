class PermissionDecorator
  include Comparable

  def self.build_collection(permissions)
    permissions.collect {|permission| new(permission)}
  end

  attr_reader :permission

  def initialize(permission)
    @permission = permission
  end

  def description
    "#{permission.action} #{permission.subject}".humanize
  end

  def <=> (other)
    self.permission <=> other.permission
  end

  def method_missing(method_name, *args, &block)
    permission.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    permission.respond_to?(method_name, include_private) || super
  end
end