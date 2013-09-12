module Addressed
  extend ActiveSupport::Concern

  included do
    has_many :addresses, as: :addressable
  end


  def build_addresses
    Address::CATEGORIES.each { |c| addresses.build(category: c) }
  end

  def postal_address
    addresses.post.first
  end


  def work_address
    addresses.work.first
  end

  def home_address
    addresses.home.first
  end

end