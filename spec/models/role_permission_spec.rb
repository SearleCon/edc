# == Schema Information
#
# Table name: role_permissions
#
#  id            :integer          not null, primary key
#  role_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe RolePermission do

  it "has a valid factory" do
    FactoryGirl.create(:role_permission).should be_valid
  end

  it { should belong_to(:role) }
  it { should belong_to(:permission) }


  it {should validate_presence_of(:permission_id)}
  it {should validate_presence_of(:role_id)}
end
