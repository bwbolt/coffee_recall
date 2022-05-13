require 'rails_helper'

RSpec.describe 'bags#edit', type: :feature do
  it 'show has a working link to a working edit view' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit "/bags/#{bag.id}"
    expect(page).to have_link('Update Bag')
    click_on 'Update Bag'
    expect(current_path).to eq("/bags/#{bag.id}/edit")
    fill_in 'Roast', with: 'dark'
    fill_in 'Size', with: 340
    check 'Ground'
    click_on 'Update Bag'
    expect(current_path).to eq("/bags/#{bag.id}")
    expect(page).to have_content('dark')
  end

  it 'there is a working link on all displayed areas' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit '/bags'
    expect(page).to have_link('Update Bag')
    click_on('Update Bag')
    expect(current_path).to eq("/bags/#{bag.id}/edit")
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_link('Update Bag')
    click_on('Update Bag')
    expect(current_path).to eq("/bags/#{bag.id}/edit")
  end
end
