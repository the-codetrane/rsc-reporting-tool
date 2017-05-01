require 'rails_helper'
require_relative '../support/login_helper'

feature 'Member Access' do

  before(:all) do
    FactoryGirl.create_list(:admin, 4)
    FactoryGirl.create(:role)
    FactoryGirl.create(:area)
    FactoryGirl.create(:sub_committee)
    FactoryGirl.create(:area_report)
    FactoryGirl.create(:sub_committee_report)
  end

  context 'Registered Member' do
    let(:group) { FactoryGirl.create(:group) }
    let(:sub_committee) { FactoryGirl.create(:sub_committee) }


    scenario 'Member can see, but not edit, reports' do
      sign_up_regular

      User.last.update(group: group, sub_committee: sub_committee)
      AreaReport.last.update(area: Area.last, created_by: User.last.email)

      visit 'area_reports'
      expect(page).to have_content('Area Reports')
      expect(page).to_not have_content('edit report')
    end

    scenario 'Regular user should not be able to see Admin dashboard' do
      sign_up_regular
      User.last.update(group: group, sub_committee: sub_committee)
      visit '/admin'
      expect(page).to have_content('You are not authorized to view this page')
    end
  end
end