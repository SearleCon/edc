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

end
