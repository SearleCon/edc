module Addressable
  extend ActiveSupport::Concern

  included do
    has_many :addresses, as: :addressable

    accepts_nested_attributes_for :addresses
  end

  def initialize_addresses
    %W(postal work home).each { |category| addresses.build(category: category)  }
  end


  def postal_address
    addresses.select { |address| address.category == 'postal' }.first
  end

  def work_address
   addresses.select { |address| address.category == 'work' }.first
  end

  def residential_address
   addresses.select { |address| address.category == 'home' }.first
  end

end