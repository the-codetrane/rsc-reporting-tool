require 'rails_helper'
require_relative '../support/login_helper'

feature 'Admin Dashboard' do

  before(:all) do
    FactoryGirl.create_list(:admin, 4)
    FactoryGirl.create(:role)
  end

  context 'Member login' do
    let(:group) { FactoryGirl.create(:group) }
    let(:sub_committee) { FactoryGirl.create(:sub_committee) }
    let(:area) { FactoryGirl.create(:area) }

    scenario 'Member should see, but not edit reports' do
      sign_up_regular
      User.last.update(group: group, sub_committee: sub_committee)
      AreaReport.create(area: area, created_by: User.first.email)

      expect(AreaReport.last.created_by).to eq(User.last.email)

      group.update(area: area)
      visit '/area_reports'
      save_and_open_page
      expect(page).to have_content('Edit report')
    end

  end
end