# == Schema Information
#
# Table name: alerts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Alert do
  it "has a valid factory" do
    FactoryGirl.create(:alerts).should be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:alerts, content: nil).should_not be_valid
  end
end
