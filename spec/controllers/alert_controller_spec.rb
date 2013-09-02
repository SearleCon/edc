require 'spec_helper'


describe AlertController do


  before(:each) do
   @alert =  FactoryGirl.create(:alerts)
  end


  describe "GET 'show'" do

    it "returns http success" do
     xhr :get, 'latest'
      response.should be_success
    end

    it "should set alert to inactive" do
      xhr :get, 'latest'
       assigns(:alerts).active == false
    end
  end

end
