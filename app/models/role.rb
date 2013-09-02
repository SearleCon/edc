# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

class Role < ActiveRecord::Base
  belongs_to :account
  has_many :users

  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  acts_as_tenant :account

  validates :name, uniqueness: true , presence: true

  before_save :format_attributes

  protected
  def format_attributes
    self.name.downcase!
  end

end
