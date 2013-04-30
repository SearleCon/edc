# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  notable_id   :integer
#  notable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  noted_by     :string(255)
#

class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true

  validates :content, presence: true

  self.per_page = 23
end
