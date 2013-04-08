class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true

  self.per_page = 25
end
