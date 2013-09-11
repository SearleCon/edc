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
  let(:alert) { FactoryGirl.build(:alert) }
  subject { alert }

  it { should be_valid }
  it { should validate_presence_of(:content) }
  it { should respond_to(:dismiss) }

  it 'should not be active after it is dismissed' do
    expect { alert.dismiss}.to change { alert.active }.from(true).to(false)
  end
end
