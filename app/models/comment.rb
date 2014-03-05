# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :string(255)
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true

end
