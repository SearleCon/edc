require 'spec_helper'

describe AccountsController do


  describe 'GET new' do
    before { get :new }

    it { should render_template(:new) }

    it 'assigns a new account' do
      expect(assigns(:account)).to be_a_new(Account)
    end
  end

  describe "POST 'create'" do
    context 'valid attributes' do
      let (:account){ FactoryGirl.build(:account) }
      before {post :create, account: account.attributes}

      it 'should create a new account in the database' do
         expect(assigns(:account).persisted?).to be_true
      end

      it { should redirect_to(new_user_registration_url(subdomain: account.subdomain)) }
    end

    context 'invalid attributes' do
      let (:account){ FactoryGirl.build(:account, subdomain: nil) }
      before {post :create, account: account.attributes}

      it 'should not create a new account in the database' do
        expect(assigns(:account).persisted?).to be_false
      end

      it { should render_template(:new) }
    end
  end

end
