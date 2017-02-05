class AddAreaReferenceToAreaReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :area_reports, :areas, index: true
  end
end
