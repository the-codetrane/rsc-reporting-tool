class AreaReport < ApplicationRecord
  belongs_to :area
  has_one :user, primary_key: :created_by, foreign_key: :email

  def mailer_submitted_by
    if self.created_by?
      user = User.find_by_email(self.created_by)
      "Submitted by #{user.na_name} from #{user.group.name}"
    else
      "Submitter unknown"
    end
  end

  def AreaReport.selector
    Rails.cache.fetch('report_selector', expires_in: 5.minutes) do
      AreaReport.all.order(:name)
    end
  end

  def report_submitted_by
    "#{self.user.na_name} from #{self.user.group.name}"
  end
end
