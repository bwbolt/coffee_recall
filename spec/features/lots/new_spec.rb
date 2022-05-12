require 'rails_helper'

RSpec.describe 'lots#new', type: :feature do
  it 'index has a link to working new lot view' do
    visit '/lots'
    expect(page).to have_link('New Lot')
    click_link('New Lot')
    expect(current_path).to eq('/lots/new')
    fill_in 'Name', with: 'Ethiopia'
    fill_in 'Lot number', with: 44
    fill_in 'Importer', with: 'Lamanita'
    click_on 'Save'
    expect(current_path).to eq('/lots')
    expect(page).to have_content('Ethiopia')
  end
end
