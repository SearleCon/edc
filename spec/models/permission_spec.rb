# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  action     :string(255)
#  subject    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Permission do

  it "has a valid factory" do
    FactoryGirl.create(:permission).should be_valid
  end

  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:subject) }
end
