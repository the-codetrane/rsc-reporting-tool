require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe "welcome" do
    let(:mail) { WelcomeMailer.welcome }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["admin@naworks.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end