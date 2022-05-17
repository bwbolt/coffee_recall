require 'rails_helper'

RSpec.describe 'lots#show', type: :feature do
  it 'shows information about the particular lot' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
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
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    lot2 = Lot.create!(name: 'guat', importer: 'lamanita', lot_number: 67, organic: true)
    bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    bag2 = lot2.bags.create!(name: 'dark', ground: true, size: 60)
    bag3 = lot1.bags.create!(name: 'light', ground: true, size: 60)
    visit "/lots/#{lot1.id}"
    expect(page).to have_content('Number of Bags from this lot: 2')
    visit "/lots/#{lot2.id}"
    expect(page).to have_content('Number of Bags from this lot: 1')
  end

  it 'has link to associated bags' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    visit "/lots/#{lot1.id}"
    expect(page).to have_link('Bags made from this lot')
  end

  it 'has a button to delete the lot and all associated bags' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'Slightly Dangerous', ground: true, size: 340)
    visit '/bags'
    expect(page).to have_content('Slightly Dangerous')
    visit "/lots/#{lot1.id}"
    expect(page).to have_link('Delete Lot')
    click_link('Delete Lot')
    expect(current_path).to eq('/lots')
    expect(page).to_not have_content('honduras')
    visit '/bags'
    expect(page).to_not have_content('Slightly Dangerous')
  end
end
