# == Schema Information
#
# Table name: applications
#
#  id               :integer          not null, primary key
#  application_date :datetime
#  status           :integer          default(0)
#  customer_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  programme_id     :integer
#  follow_up_date   :date
#

require 'spec_helper'

describe Application do
  pending "add some examples to (or delete) #{__FILE__}"
end
