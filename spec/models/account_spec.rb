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
  let(:account) { FactoryGirl.build(:account) }

  subject { account }

  it { should be_valid }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:subdomain) }
  it { should ensure_length_of(:subdomain).is_at_most(32).with_long_message(/maximum of 32 characters/) }
  it { should_not allow_value(%w(111 1TP PPP P@P)).for(:subdomain)}
  it { should_not allow_value(%w(www ftp mail)).for(:subdomain) }
end
