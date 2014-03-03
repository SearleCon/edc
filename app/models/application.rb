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
  include UserStamps

  enum status: { prospect: 0, active: 1 }

  attr_accessor :modifier

  belongs_to :customer
  belongs_to :programme

  after_create :log_creation_activity
  after_update :log_updated_activity

  protected
  def log_creation_activity
    Activity.create(
        subject: self,
        name: 'application_created',
        detail: "Application for #{programme.name} for #{customer.full_name} was created.",
        user: created_by
    )
  end

  def log_updated_activity
    Activity.create(
        subject: self,
        name: 'application_updated',
        detail: changes.map {|attribute, values| "#{attribute} was changed from #{values.first} to #{values.second}" }.join(','),
        user: updated_by
    )
  end
end
