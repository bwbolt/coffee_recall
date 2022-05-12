require 'rails_helper'

RSpec.describe 'lots#show', type: :feature do
  it 'shows information about the particular lot' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    visit "/lots/#{lot1.id}"
    expect(page).to have_content(lot1.name)
    expect(page).to have_content(lot1.lot_number)
    expect(page).to have_content(lot1.organic)
    expect(page).to have_content(lot1.importer)
    expect(page).to have_content(lot1.created_at)
    expect(page).to have_content(lot1.updated_at)
    expect(page).to have_content(lot1.id)
  end

  it 'shows how many bags are associated with this lot' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    lot2 = Lot.create!(name: 'guat', lot_number: 67, organic: true)
    bag1 = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot2.id)
    bag3 = Bag.create!(roast: 'light', ground: true, size: 60, lot_id: lot1.id)
    visit "/lots/#{lot1.id}"
    expect(page).to have_content('Number of Bags from this lot: 2')
    visit "/lots/#{lot2.id}"
    expect(page).to have_content('Number of Bags from this lot: 1')
  end
end
