class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true

  validates :content, presence: true

  self.per_page = 25
end
