require 'spec_helper'

describe Address do

  it "has a valid factory" do
     FactoryGirl.create(:address)
  end

  it { should belong_to(:addressable) }
  it { should validate_presence_of(:street_address1) }
  it { should validate_presence_of(:street_address2) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_numericality_of(:postal_code) }

end
