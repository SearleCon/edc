module Addressable
  extend ActiveSupport::Concern

  CATEGORIES = {postal: 'postal', work: 'work', home: 'home'}

  included do
    has_many :addresses, as: :addressable
    accepts_nested_attributes_for :addresses
  end

  def initialize_addresses
    CATEGORIES.values.each { |v| addresses.build(category: v)  }
  end

  def postal_address
    addresses.select { |address| address.category.eql?(CATEGORIES[:postal]) }.first
  end

  def work_address
   addresses.select { |address| address.category.eql?(CATEGORIES[:work]) }.first
  end

  def residential_address
   addresses.select { |address| address.category.eql?(CATEGORIES[:home])}.first
  end

end