require 'rails_helper'

RSpec.describe 'bags#show', type: :feature do
  it 'shows a specific bag and its attributes' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit "/bags/#{bag.id}"
    expect(page).to have_content(bag.roast)
    expect(page).to have_content(bag.ground)
    expect(page).to have_content(bag.size)
    expect(page).to have_content(bag.id)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.updated_at)
  end

  it 'has a working delete button' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'Slightly Dangerous', ground: true, size: 340, lot_id: lot1.id)
    visit '/bags'
    expect(page).to have_content('Slightly Dangerous')
    visit "/bags/#{bag.id}"
    expect(page).to have_link('Delete Bag')
    click_link('Delete Bag')
    expect(current_path).to eq('/bags')
    expect(page).to_not have_content('Slightly Dangerous')
  end
end
