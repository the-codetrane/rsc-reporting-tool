class Report < ApplicationRecord

  belongs_to :committee

  def report_committee
    self.committee.name
  end

  def mailer_submitted_by
    if self.created_by?
    user = User.find_by_email(self.created_by)
    "Submitted by #{user.na_name} from #{user.group.name}"
    else
      "Submitter unknown"
    end
  end

  def Report.selector
    Rails.cache.fetch('report_selector', :expires_in => 5.minutes) do
      Report.all.order(:name)
    end
  end

end
