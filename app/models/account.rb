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
  has_many :users


  validates :company, :subdomain, presence: true
  validates :subdomain, format:{ with: /^[a-z0-9_]+$/ , message: "must be lowercase alphanumerics only"}
  validates :subdomain, length: {maximum: 32, message: "exceeds maximum of 32 characters"}
  validates :subdomain, exclusion: {in: ['www', 'mail', 'ftp'], message: "is not available"}
end
