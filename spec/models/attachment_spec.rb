# == Schema Information
#
# Table name: attachments
#
#  id              :integer          not null, primary key
#  filename        :string(255)
#  attachable_id   :integer
#  attachable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Attachment do

  it "has a valid factory" do
    FactoryGirl.create(:attachment)
  end

  it { should validate_presence_of(:filename) }

end
