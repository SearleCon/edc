# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  action     :string(255)
#  subject    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  scope :per_subject, ->(subject){ where(subject: subject) }

  validates :action, :subject, presence: true
end
