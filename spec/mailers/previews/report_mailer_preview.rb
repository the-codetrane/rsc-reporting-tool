# Preview all emails at
class ReportMailerPreview < ActionMailer::Preview
  def report_email
    sub_committee = SubCommittee.first
    ReportsMailer.report_email(sub_committee)
  end

  def rsc_email
    ReportsMailer.rsc_email
  end

end
