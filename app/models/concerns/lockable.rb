module Lockable
  extend ActiveSupport::Concern

  def update_with_locking(*args)
    update(*args)
  rescue ActiveRecord::StaleObjectError
    self.lock_version = lock_version_was
    errors.add :base, "This record changed while you were editing."
    changes.except("updated_at").each do |name, values|
      errors.add name, "was #{values.first}"
    end
    false
  end

end