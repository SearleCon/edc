module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope   -> { where(trashed: false) }
    scope :trashed, -> { where(trashed: true) }

    define_callbacks :trash, terminator: "result == false"
    set_callback  :trash, :before_trash, if: Proc.new { self.respond_to?(:before_trash) }
    set_callback  :trash, :after, :after_trash, if: :trashed?
  end

  def trash
    run_callbacks :trash do
     update_attributes trashed: true
     freeze
    end
  end

  def before_trash
     p 'before'
  end

  def after_trash
   p 'after'
  end

  def restore
    update_attributes trashed: false
  end

  module ClassMethods
    def trash_all
      update_all(trashed: true)
    end

    def restore_all
     trashed.update_all(trashed: false)
    end

  end


end