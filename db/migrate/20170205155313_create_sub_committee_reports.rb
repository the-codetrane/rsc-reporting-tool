class CreateSubCommitteeReports < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_committee_reports do |t|
      t.string :title
      t.string :attendees
      t.text :old_business
      t.text :new_business
      t.text :notes
      t.string :created_by
      t.references :committee, foreign_key: true

      t.timestamps
    end
  end
end
