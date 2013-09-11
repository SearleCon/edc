require 'spec_helper'


describe AlertsController do
  let!(:alert) { FactoryGirl.create(:alert) }

  describe "GET 'index'" do

    it 'populates an array of active alerts' do
      xhr :get, 'index'
      expect(assigns(:alerts)).to match_array([alert])
    end

    it 'renders the index template' do
     xhr :get, 'index'
     expect(response).to render_template :index
    end
  end

  describe "Delete 'destroy'" do
    it 'deletes the alert' do
      expect {
        xhr :delete, 'destroy', id: alert
      }.to change(Alert,:count).by(-1)
    end
  end

end
