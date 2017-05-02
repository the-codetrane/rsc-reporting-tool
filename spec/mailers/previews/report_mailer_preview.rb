class ReportMailerPreview < ActionMailer::Preview
  def sub_committee_report_email
    sub_committee = SubCommittee.last
    ReportsMailer.sub_committee_report_email(sub_committee)
  end

  def rsc_email
    ReportsMailer.rsc_email
  end

end