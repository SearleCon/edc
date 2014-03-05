require 'spec_helper'

describe Notable do

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
    include Notable
  end

  let(:wrapper){ Dummy.new }

  it "should create a has_many association" do
    wrapper.should have_many(:comments)
  end
end