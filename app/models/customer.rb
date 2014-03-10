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
  include Commentable
  include PublicActivity::Model
  tracked except: :destroy, params: {
      changes:  proc {|controller, model| (model.changes.except(:updated_at, :created_at, :id).each_value {|v| v.compact!})}
  }

  has_paper_trail

  has_many :applications

  validates :name, :surname, presence: true

  to_param :full_name

  def full_name
    "#{name} #{surname}"
  end


end
