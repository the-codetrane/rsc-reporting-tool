# Preview all emails at
class ReportMailerPreview < ActionMailer::Preview
  def report_email
    committee = Committee.first
    ReportsMailer.report_email(committee)
  end

end
