require 'rails_helper'

RSpec.describe 'lots#edit', type: :feature do
  it 'show has a working link to a working edit view' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit "/lots/#{lot1.id}"
    expect(page).to have_link('Update Lot')
    click_on 'Update Lot'
    expect(current_path).to eq("/lots/#{lot1.id}/edit")
    fill_in 'Name', with: 'Ethiopia'
    fill_in 'Lot number', with: 44
    fill_in 'Importer', with: 'Lamanita'
    check 'Organic'
    click_on 'Save'
    expect(current_path).to eq("/lots/#{lot1.id}")
    expect(page).to have_content('Ethiopia')
  end

  it 'has a link from lots index' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    visit '/lots'
    expect(page).to have_link('Edit')
    click_link('Edit')
    expect(current_path).to eq("/lots/#{lot1.id}/edit")
  end
end
