module UserStamps
  extend ActiveSupport::Concern

  included do
    attr_accessor :modifier
    belongs_to :created_by, class: User
    belongs_to :updated_by, class: User
    before_save :set_user_stamps
  end

  protected
    def set_user_stamps
      return false unless modifier
      self.created_by = modifier if new_record?
      self.updated_by = modifier
    end
end