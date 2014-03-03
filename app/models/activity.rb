# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject_id   :integer          not null
#  subject_type :string(255)      not null
#  name         :string(255)      not null
#  detail       :string(255)      not null
#  user_id      :integer          not null
#

class Activity < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :user

  scope :recent, ->(limit=10){ order(created_at: :desc).limit(limit) }
end
