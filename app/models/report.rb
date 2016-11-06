class Report < ApplicationRecord

  belongs_to :committee

  def report_committee
    Committee.find(self.committee_id).name
  end

  def mailer_submitted_by
    if self.created_by?
    user = User.find_by_email(self.created_by)
    "Submitted by #{user.na_name} from #{user.group.name}"
    else
      "Submitter unknown"
    end
  end

end
