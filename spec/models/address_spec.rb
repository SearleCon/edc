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

require 'spec_helper'

describe Address do
  let(:address){ FactoryGirl.build(:address) }

  subject { address }

  it { should belong_to(:addressable) }
  it { should validate_presence_of(:street_address1) }
  it { should validate_presence_of(:street_address2) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_numericality_of(:postal_code) }

end
