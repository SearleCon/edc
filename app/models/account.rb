class Account < ActiveRecord::Base
  has_many :users


  validates :company, presence: true
  validates :subdomain, format:{ with: /^[a-z0-9_]+$/ , message: "must be lowercase alphanumerics only"}
  validates :subdomain, length: {maximum: 32, message: "exceeds maximum of 32 characters"}
  validates :subdomain, exclusion: {in: ['www', 'mail', 'ftp'], message: "is not available"}
end
