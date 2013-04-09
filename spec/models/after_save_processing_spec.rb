require 'spec_helper'

describe AfterSaveProcessing do
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
    include AfterSaveProcessing
  end

  describe "Persistence Extensions" do

    let(:wrapper){ Dummy.new }

    it "should have a created? method" do
      wrapper.should respond_to :created?
    end

    it "should have an updated? method" do
      wrapper.should respond_to :updated?
    end

  end

  describe "After Commit Callbacks" do

    its "commit callbacks must not be empty" do
      Dummy._commit_callbacks.empty?.should_not be_true
    end

    it "should have a after_update_processing method" do
      Dummy._commit_callbacks.collect(&:filter).include?(:after_update_processing).should be_true
    end

    it "should have a after_create_processing method" do
      Dummy._commit_callbacks.collect(&:filter).include?(:after_create_processing).should be_true
    end

  end

end