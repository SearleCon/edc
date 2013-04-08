class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :street_address1, :street_address2, :city, :category, :country, :state, :postal_code, presence: true
  validates :postal_code, numericality: true
end
