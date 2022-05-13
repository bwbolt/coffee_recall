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

  it "has a working button to sort by 'name' (roast)" do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag1 = Bag.create!(roast: 'light', ground: true, size: 340, lot_id: lot1.id)
    bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot1.id)
    bag3 = Bag.create!(roast: 'medium', ground: true, size: 500, lot_id: lot1.id)
    visit "/lots/#{lot1.id}/bags"
    expect(bag1.roast).to appear_before(bag2.roast)
    expect(page).to have_link('Sort')
    click_link('Sort')
    expect(current_path).to eq("/lots/#{lot1.id}/bags")
    expect(bag2.roast).to appear_before(bag3.roast)
  end

  it 'has a display by size input' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag1 = Bag.create!(roast: 'light', ground: true, size: 340, lot_id: lot1.id)
    bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot1.id)
    bag3 = Bag.create!(roast: 'medium', ground: true, size: 500, lot_id: lot1.id)
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_content('dark')
    expect(page).to have_button('Search By Bag Size')
    fill_in 'size', with: 70
    click_on('Search By Bag Size')
    expect(current_path).to eq("/lots/#{lot1.id}/bags")
    expect(page).to_not have_content('dark')
  end
end
