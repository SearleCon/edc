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
  let(:role_permission) { FactoryGirl.build(:role_permission)  }

   subject { role_permission }

  it { should belong_to(:role) }
  it { should belong_to(:permission) }
  it { should validate_presence_of(:permission)}
  it { should validate_presence_of(:role) }
end
