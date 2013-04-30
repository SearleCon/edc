# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  company         :string(255)
#  subdomain       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  drop_box_key    :string(255)
#  drop_box_secret :string(255)
#

require 'spec_helper'

describe Account do
  it "has a valid factory" do
     FactoryGirl.create(:account).should be_valid
  end

  it "is invalid without a company" do
    FactoryGirl.build(:account, company: nil).should_not be_valid
  end

  it "is invalid without a subdomain" do
    FactoryGirl.build(:account, subdomain: nil).should_not be_valid
  end

  it "is invalid if the subdomain length is greater than 32 characters" do
    FactoryGirl.build(:account, subdomain: 'a' * 33).should_not be_valid
  end

  it "is invalid if the subdomain format does not contain lowercase alphanumerics" do
    FactoryGirl.build(:account, subdomain: "+PPT$ZZ").should_not be_valid
  end

  it "is invalid if subdomain includes (www ftp mail test)" do
     FactoryGirl.build(:account, subdomain: 'www').should_not be_valid
     FactoryGirl.build(:account, subdomain: 'ftp').should_not be_valid
     FactoryGirl.build(:account, subdomain: 'mail').should_not be_valid
  end

end
