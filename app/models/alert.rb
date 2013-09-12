# == Schema Information
#
# Table name: alerts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Alert < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  scope :active, -> { where(active: true)}

  validates :content, presence: true

  def dismiss
    update(active: false)
  end
end
