require 'rails_helper'

RSpec.describe 'bags#index', type: :feature do
  it 'shows all bags and attributes' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit '/bags'
    expect(page).to have_content(bag.roast)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.ground)
    expect(page).to have_content(bag.size)
    expect(page).to have_content(bag.id)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.updated_at)
  end
end
