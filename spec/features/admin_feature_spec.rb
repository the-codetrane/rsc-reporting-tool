require 'rails_helper'
require_relative '../support/login_helper'

feature 'Admin Dashboard' do

  before(:all) do
    FactoryBot.create_list(:admin, 4)
    FactoryBot.create(:role)
  end

  context 'Admin login' do
    let(:group) { FactoryBot.create(:group) }
    let(:sub_committee) { FactoryBot.create(:sub_committee) }
    let(:area) { FactoryBot.create(:area) }

    scenario 'Admin should see the Admin link' do
      sign_up_admin
      User.last.update(group: group, sub_committee: sub_committee)
      group.update(area: area)
      visit root_path
      expect(page).to have_content('Admin')
    end

    scenario 'Admin should see the Admin dashboard' do
      sign_up_admin
      User.last.update(group: group, sub_committee: sub_committee)
      group.update(area: area)
      visit '/admin'
      expect(page).to have_content('Admin Dashboard')
    end

    scenario 'Admin should be able to delete member' do
      sign_up_admin
      User.last.update(group: group, sub_committee: sub_committee)
      group.update(area: area)

      visit '/admin/members'
      expect(page).to have_button('Delete Member')

    end
  end


end