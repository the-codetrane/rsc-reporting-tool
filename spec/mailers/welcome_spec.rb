require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  describe 'welcome' do
    let(:user) {FactoryBot.create(:user)}
    let(:mail) { WelcomeMailer.welcome(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to the RSC SubCommittee Reporting Tool')
      expect(mail.to).to eq(['michael.m.cain.ii@gmail.com'])
      expect(mail.from).to eq(['no-reply@naworks.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end

end
