require "spec_helper"

describe UserMailer do
  describe "welcome" do
    let(:user) { FactoryGirl.build(:user) }
    let(:mail) { UserMailer.welcome(user) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Welcome'
    end

    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end

    it 'body contains subdomain root url' do
      mail.body.encoded.should match(root_url(subdomain: user.subdomain))
    end
  end
end
