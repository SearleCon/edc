# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :integer
#

require 'spec_helper'

describe Role do

  it "has a valid factory" do
    FactoryGirl.create(:role).should be_valid
  end

  it { should have_many(:role_permissions) }
  it { should have_many(:permissions).through(:role_permissions) }


  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}


end
