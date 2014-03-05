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

class Application < ActiveRecord::Base
  include Commentable

  has_paper_trail

  enum status: { prospect: 0, active: 1 }

  attr_accessor :modifier

  belongs_to :customer
  belongs_to :programme

end
