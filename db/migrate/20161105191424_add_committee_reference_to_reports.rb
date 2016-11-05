class AddCommitteeReferenceToReports < ActiveRecord::Migration[5.0]
  def change
    change_table :reports do |t|
      t.remove :committee
      t.references :committee, foreign_key: true
    end
  end
end
