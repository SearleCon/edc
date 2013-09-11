require 'spec_helper'

describe RolePermissionsController do

  before (:each) do
    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  describe "GET 'edit'" do
    it "assigns roles to @roles" do
      roles = Role.all
      get :edit
      expect(assigns(:roles)).to match_array roles
    end

    it "assigns permissions to @permissions" do
      permissions = Permission.all
      get :edit
      expect(assigns(:permissions)).to match_array permissions
    end

    it "renders the edit template" do
      get :edit
      expect(response).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    before (:each) do
      @role = Role.first
      @permission = FactoryGirl.create(:permission)
    end


    it "updates the permissions on the role" do
      put :update, roles: { @role.id.to_s => {permission_ids: [@permission.id]} }
      @role.reload
      expect(@role.permissions.first).to eq @permission
    end


    it "redirects to the permissions edit page" do
      put :update, roles: { @role.id.to_s => {permission_ids: [@permission.id]} }
      expect(response).to redirect_to permissions_edit_url
    end
  end
end
