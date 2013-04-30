require 'spec_helper'

describe Attachable do

  before :all do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.create_table :dummies
  end

  after :all do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.drop_table :dummies
  end

  class Dummy < ActiveRecord::Base
    include Attachable
  end

  let(:wrapper){ Dummy.new }

  it "should create a has_many association" do
    wrapper.should have_many(:attachments)
  end
end