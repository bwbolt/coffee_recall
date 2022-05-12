require 'rails_helper'

RSpec.describe 'bags#new', type: :feature do
  it 'lot bag index has a button to create a new bag which takes to working view' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_link('Create Bag')
    click_link('Create Bag')
    expect(current_path).to eq("/lots/#{lot1.id}/bags/new")
    fill_in 'Roast', with: 'dark'
    fill_in 'Size', with: 340
    click_on 'Create Bag'
    expect(current_path).to eq("/lots/#{lot1.id}/bags")
    expect(page).to have_content('dark')
  end
end
