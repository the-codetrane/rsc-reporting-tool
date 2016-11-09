class ReportsMailer < ApplicationMailer
  default from: 'no-reply@naworks.com'

  def report_email(committee)
    @committee = committee
    @report = Report.find_by_committee_id(committee.id)
    @recipients = User.where(committee_id: committee.id).pluck(:email)
    mail(to: @recipients, subject: "#{committee.name} Report, #{Date.today.strftime('%b-%Y')}")
  end
end