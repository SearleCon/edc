require 'spec_helper'

describe DropBoxController do

  describe "GET 'authorize'" do
    it "returns http success" do
      get 'authorize'
      response.should be_success
    end
  end

  describe "GET 'authorize_callback'" do
    it "returns http success" do
      get 'authorize_callback'
      response.should be_success
    end
  end

end
