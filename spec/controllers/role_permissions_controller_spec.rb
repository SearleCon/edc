require 'spec_helper'

describe RolePermissionsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:role) { user.role }

  before { sign_in user }

  describe "GET 'edit'" do
    before { get :edit }

    it { should render_template(:edit) }

    it "assigns roles to @roles" do
      expect(assigns(:role_permissions)).to be_an_instance_of(RolePermissionsDecorator)
    end

  end

  describe "PATCH 'update'" do
    let(:permission){ FactoryGirl.create(:permission) }
    before {patch :update, roles: { role.id.to_s => {permission_ids: [permission.id]} }  }

    it { should redirect_to(role_permissions_edit_url) }


    it "updates the permissions on the role" do
      expect(role.permissions.first).to eq permission
    end
  end
end
