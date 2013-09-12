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
#  trashed      :boolean          default(FALSE)
#

require 'spec_helper'

describe Note do
  let(:note){ FactoryGirl.build(:note) }
  subject { note }

  it { should validate_presence_of(:content) }

end
