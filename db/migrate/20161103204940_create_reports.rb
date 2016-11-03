class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :committee
      t.string :attendees
      t.text :old_business
      t.text :new_business
      t.text :notes

      t.timestamps
    end
  end
end
