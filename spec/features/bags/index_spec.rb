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

  it 'has a link to it from every page' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    bag = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
    visit '/'
    expect(page).to have_link('Bags')
    visit '/lots'
    expect(page).to have_link('Bags')
    visit '/lots/new'
    expect(page).to have_link('Bags')
    visit '/lots/new'
    expect(page).to have_link('Bags')
    visit "/lots/#{lot1.id}"
    expect(page).to have_link('Bags')
    visit "/lots/#{lot1.id}/edit"
    expect(page).to have_link('Bags')
    visit "/lots/#{lot1.id}/bags"
    expect(page).to have_link('Bags')
    visit '/bags'
    expect(page).to have_link('Bags')
    visit "/bags/#{bag.id}"
    expect(page).to have_link('Bags')
    visit "/bags/#{bag.id}/edit"
    expect(page).to have_link('Bags')
    visit "/lots/#{lot1.id}/bags/new"
    expect(page).to have_link('Bags')
  end
end
