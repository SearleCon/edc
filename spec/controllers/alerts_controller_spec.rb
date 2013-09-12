require 'spec_helper'


describe AlertsController do
  let(:alert) { FactoryGirl.create(:alert) }

  describe 'GET index' do
    before { xhr :get, :index }
    it { should respond_with(:success) }
    it { should render_template(:index) }

    it 'assigns the alerts' do
     assigns(:alerts).should match_array([alert])
    end
  end

  describe 'DELETE destroy' do
    before { xhr :delete, :destroy, id: alert, format: :json }

    it {should respond_with(:no_content)}

    it 'deletes the alert' do
      expect(assigns(:alert).destroyed?).to be_true
    end
  end

end
