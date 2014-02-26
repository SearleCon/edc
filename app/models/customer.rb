# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  surname    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Customer < ActiveRecord::Base
  include UserStamps

  attr_accessor :modifier

  validates :name, :surname, presence: true

  to_param :full_name


  def full_name
    "#{name} #{surname}"
  end

end
