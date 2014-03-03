# == Schema Information
#
# Table name: customers
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  surname       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  created_by_id :integer
#  updated_by_id :integer
#

class Customer < ActiveRecord::Base
  include UserStamps

  attr_accessor :modifier

  has_many :applications
  has_many :activities, as: :subject

  validates :name, :surname, presence: true

  to_param :full_name

  after_create :log_creation_activity
  after_update :log_updated_activity

  def full_name
    "#{name} #{surname}"
  end

  def recent_activities(limit=10)
    activities.order(created_at: :desc).limit(limit)
  end

  protected
   def log_creation_activity
     Activity.create(
         subject: self,
         name: 'customer_created',
         detail: "Customer #{name} #{surname} was created.",
         user: created_by
     )
   end

   def log_updated_activity
     Activity.create(
         subject: self,
         name: 'customer_updated',
         detail: changes.map {|attribute, values| "#{attribute} was changed from #{values.first} to #{values.second}" }.join(','),
         user: updated_by
     )
   end


end
