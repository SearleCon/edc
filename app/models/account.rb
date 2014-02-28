# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  company         :string(255)
#  subdomain       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  drop_box_key    :string(255)
#  drop_box_secret :string(255)
#

class Account < ActiveRecord::Base
  has_many :users, dependent: :destroy

  validates :company, :subdomain,presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, format:{ with: /\A[a-z0-9_]+\z/ , message: "must be lowercase alphanumerics only"}
  validates :subdomain, length: {maximum: 32, too_long: 'maximum of 32 characters'}
  validates :subdomain, exclusion: {in: ['www', 'mail', 'ftp'], message: "is not available"}
end
