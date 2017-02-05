class AddAreaReferenceToAreaReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :area_reports, :area, index: true
  end
end
