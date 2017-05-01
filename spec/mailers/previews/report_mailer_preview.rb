class ReportMailerPreview < ActionMailer::Preview
  def report_email
    sub_committee = SubCommittee.first
    ReportsMailer.sub_committee_report_email(sub_committee)
  end

  def rsc_email
    ReportsMailer.rsc_email
  end

end
