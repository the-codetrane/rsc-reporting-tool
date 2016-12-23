require 'rails_helper'
require_relative '../support/login_helper'

feature 'Admin Dashboard' do

  before(:all) do
    FactoryGirl.create_list(:admin, 4)
    FactoryGirl.create(:role)
  end

  context 'Admin login' do
    let(:group) { FactoryGirl.create(:group) }
    let(:committee) { FactoryGirl.create(:committee) }
    let(:area) { FactoryGirl.create(:area) }

    scenario 'Admin should see the Admin dashboard' do
      sign_up_admin
      User.last.update(group: group, committee: committee)
      group.update(area: area)
      visit '/admin'
      expect(page).to have_content('Admin Dashboard')
    end
  end

  context 'Member login' do
    let(:group) { FactoryGirl.create(:group) }
    let(:committee) { FactoryGirl.create(:committee) }

    scenario 'Regular user should not be able to see Admin dashboard' do
      sign_up_regular
      User.last.update(group: group, committee: committee)
      visit '/admin'
      expect(page).to have_content('You are not authorized to view this page')
    end
  end

end