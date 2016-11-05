class ReportsMailer < ApplicationMailer
  default from: 'no-reply@naworks.com',
          return_path: 'it-committee@naworks.com'

  def report_email(committee)
    @committee = committee
    @recipients = User.where(committee_id: committee.id).pluck(:email)
    mail(to: @recipients, subject: "#{committee.name} Report, #{Date.now.strftime('%b %d, %Y')}")
  end
end
