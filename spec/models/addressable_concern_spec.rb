require 'spec_helper'

describe Addressed do

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
    include Addressed
  end

  let(:wrapper){ Dummy.new }

  it "should create a has_many association" do
    wrapper.should have_many(:addresses)
  end

  it "should add a initialize_addresses method" do
     wrapper.should respond_to :initialize_addresses
  end

  it "should add a postal_address method" do
    wrapper.should respond_to :postal_address
  end


  it "should add a work_address method" do
    wrapper.should respond_to :work_address
  end

  it "should add a residential_address method" do
    wrapper.should respond_to :residential_address
  end

  it "should initialize the different address types" do
    wrapper.initialize_addresses
    wrapper.addresses.size.should eq 3
  end

  describe "address type finders" do
    before(:each) do
      wrapper.initialize_addresses
    end

    it "should find the postal_address" do
      wrapper.postal_address.category.should == "postal"
    end

    it "should find the work_address" do
      wrapper.work_address.category.should == "work"
    end

    it "should find the residential_address" do
      wrapper.residential_address.category.should == "home"
    end
  end

end

