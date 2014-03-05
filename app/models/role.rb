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


  validates :name, presence: true

  scope :exclude, -> (*roles) {where.not(name: roles)}

  before_validation :format_attributes

  protected
    def format_attributes
      name.downcase!
    end

end
