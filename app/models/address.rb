# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  street_address1  :string(255)
#  street_address2  :string(255)
#  city             :string(255)
#  state            :string(255)
#  country          :string(255)
#  postal_code      :string(255)
#  category         :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  enum :category, [:post, :work, :home]

  validates :street_address1, :street_address2, :city, :country, :state, :postal_code, presence: true
  validates :postal_code, numericality: true

end
