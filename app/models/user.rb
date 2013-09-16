# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
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
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#

class User < ActiveRecord::Base
  include Addressed, Notable, AttributeDefaults


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_tenant :account

  belongs_to :account, autosave: true
  belongs_to :role

  delegate :company, :subdomain, :drop_box_key, :drop_box_secret , to: :account, allow_nil: true
  delegate :name, :permissions, to: :role, prefix: true, allow_nil: true

  scope :exclude, -> (user){where.not(id: user)}

  validates_uniqueness_to_tenant :email
  validates_associated :account

  def has_role?(role)
    return false unless self.role_name
    self.role_name == role.to_s
  end

  private
  def defaults
    { timezone: Time.zone.name }
  end
end
