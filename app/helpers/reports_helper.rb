module ReportsHelper
  def committee_select
    selections = []
    Committee.all.order(:name).each do |committee|
      selections << [committee.name, committee.name]
    end
    selections
  end
end
