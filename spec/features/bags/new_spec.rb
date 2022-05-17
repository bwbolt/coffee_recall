require 'rails_helper'

RSpec.describe 'bags#new', type: :feature do
  it 'lot bag index has a button to create a new bag which takes to working view' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_link('Create Bag')
    click_link('Create Bag')
    expect(current_path).to eq("/lots/#{lot1.id}/bags/new")
    fill_in 'name', with: 'dark'
    fill_in 'Size', with: 340
    click_on 'Create Bag'
    expect(current_path).to eq("/lots/#{lot1.id}/bags")
    expect(page).to have_content('dark')
  end
end
