# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  notable_id   :integer
#  notable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  noted_by     :string(255)
#

require 'spec_helper'

describe Note do

  it "has a valid factory" do
    FactoryGirl.create(:note).should be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:note, content: nil).should_not be_valid
  end

end
