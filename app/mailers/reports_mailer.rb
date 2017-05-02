class ReportsMailer < ApplicationMailer
  default from: 'no-reply@naworks.com'

  def sub_committee_report_email(committee)
    @sub_committee = committee
    @report = SubCommitteeReport.find_by_sub_committee_id(committee.id)
    @recipients = User.where(sub_committee_id: committee.id).pluck(:email)
    mail(to: @recipients, subject: "#{committee.name} Report, #{Date.today.strftime('%b-%Y')}")
  end

  def area_report_email(area)
    @area = area
    @report = AreaReport.find_by_area_id(area.id)
    groups = @area.groups.pluck(:name)
    @recipients = []

    User.all do |user|
      emails << user.email if groups.include?(user.email)
    end

    mail(to: @recipients, subject: "#{area.name} Report, #{Date.today.strftime('%b-%Y')}")
  end

  def rsc_email
    @reports = SubCommitteeReport.where(created_at: (7.days.ago..DateTime.now))
    @recipients = User.all.pluck(:email)
    mail(to: @recipients, subject: "RSC Sub-Committee Report - #{Date.today.strftime('%b-%Y')}")
  end
end