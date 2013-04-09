require 'spec_helper'

describe Note do

  it "has a valid factory" do
    FactoryGirl.create(:note).should be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:note, content: nil).should_not be_valid
  end

end
