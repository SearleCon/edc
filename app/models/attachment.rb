# == Schema Information
#
# Table name: attachments
#
#  id              :integer          not null, primary key
#  filename        :string(255)
#  attachable_id   :integer
#  attachable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true


  validates :filename, presence: true
end
