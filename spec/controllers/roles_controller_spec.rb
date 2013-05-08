require 'spec_helper'

describe RolesController do

  before (:each) do

    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  describe "GET 'new'" do
    it "assigns a new Role to @role" do
      get :new
      expect(assigns(:role)).to be_a_new(Role)
    end

    it "renders a new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

end
