class CreateAreaReports < ActiveRecord::Migration[5.0]
  def change
    create_table :area_reports do |t|
      t.string :title
      t.string :attendees
      t.text :area_status
      t.text :area_needs
      t.text :events
      t.text :news
      t.text :motions
      t.text :notes
      t.references :area, index: true

      t.timestamps
    end
  end
end
