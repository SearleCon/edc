class Alert < ActiveRecord::Base
  default_scope -> { order('id desc').where(active: true) }

  def dismiss
    toggle! :active
  end
end
