# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  account_id             :integer
#  timezone               :string(255)
#  role_id                :integer
#

class User < ActiveRecord::Base
  include Notable
  include Addressable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_tenant :account

  belongs_to :account, autosave: true
  belongs_to :role, autosave: true

  accepts_nested_attributes_for :account

  delegate :company, :subdomain, :drop_box_key, :drop_box_secret , to: :account, allow_nil: true

  delegate :name, :permissions, to: :role, prefix: true, allow_nil: true

  scope :exclude, ->(user) {where.not(id: user)}

  validates_uniqueness_to_tenant :email
  validates_associated :account


  after_initialize :init


  def has_role?(role)
    return false unless self.role_name
    self.role_name == role.to_s
  end


  protected
  def init
    self.timezone = Time.zone.name if new_record?
  end
end
