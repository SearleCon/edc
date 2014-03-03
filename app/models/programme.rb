# == Schema Information
#
# Table name: programmes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Programme < ActiveRecord::Base
end
