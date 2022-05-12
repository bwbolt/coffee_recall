require 'rails_helper'

RSpec.describe 'lots#show_children', type: :feature do
  it 'shows all bags associated with that particular lot' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    lot2 = Lot.create!(name: 'guat', lot_number: 67, organic: true)
    bag1 = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot2.id)
    bag3 = Bag.create!(roast: 'light', ground: true, size: 60, lot_id: lot1.id)
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_content(bag1.roast)
    expect(page).to have_content(bag1.ground)
    expect(page).to have_content(bag1.size)
    expect(page).to have_content(bag1.id)
    expect(page).to have_content(bag1.created_at)
    expect(page).to have_content(bag1.updated_at)
    expect(page).to have_content(bag3.roast)
    expect(page).to have_content(bag3.ground)
    expect(page).to have_content(bag3.size)
    expect(page).to have_content(bag3.id)
    expect(page).to have_content(bag3.created_at)
    expect(page).to have_content(bag3.updated_at)
  end
end
