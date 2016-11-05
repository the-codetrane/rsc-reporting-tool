class Report < ApplicationRecord

  belongs_to :committee

  def report_committee
    Committee.find(self.committee_id).name
  end

end
