# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :integer
#

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :users_roles
  belongs_to :resource, polymorphic: true
  belongs_to :account

  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  acts_as_tenant :account

  scopify

  validates :name, uniqueness: true , presence: true

end
