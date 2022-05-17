require 'rails_helper'

RSpec.describe 'bags#index', type: :feature do
  it 'shows all bags and attributes' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    visit '/bags'
    expect(page).to have_content(bag.name)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.ground)
    expect(page).to have_content(bag.size)
    expect(page).to have_content(bag.id)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.updated_at)
  end

  it 'has a link to it from every page' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
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

  it "only shows bags with the value 'true' for ground" do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'dark', ground: true, size: 340)
    bag2 = lot1.bags.create!(name: 'medium', ground: false, size: 340)
    bag3 = lot1.bags.create!(name: 'light', ground: true, size: 340)
    visit '/bags'
    expect(page).to have_content('dark')
    expect(page).to have_content('light')
    expect(page).to_not have_content('medium')
  end

  it 'has a working delete bag button for every bag' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'dark', ground: true, size: 340)
    visit '/bags'
    expect(page).to have_content('dark')
    expect(page).to have_link('Delete Bag')
    click_link('Delete Bag')
    expect(current_path).to eq('/bags')
    expect(page).to_not have_content('dark')
  end

  it 'has a working Search by name (exact match) field' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    lot2 = Lot.create!(name: 'brazil', importer: 'sweet marias', lot_number: 44, organic: true)
    bag2 = lot2.bags.create!(name: 'dark', ground: true, size: 340)
    visit '/bags'
    fill_in 'exact_match', with: 'medium'
    click_on 'Search for exact match'
    expect(current_path).to eq('/bags')
    expect(page).to have_content('medium')
    expect(page).to_not have_content('dark')
  end

  it 'has a working Search by name (partial match) field' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    lot2 = Lot.create!(name: 'brazil', importer: 'sweet marias', lot_number: 44, organic: true)
    bag2 = lot2.bags.create!(name: 'dark', ground: true, size: 340)
    visit '/bags'
    fill_in 'similar', with: 'da'
    click_on 'Search for similar match'
    expect(current_path).to eq('/bags')
    expect(page).to have_content('dark')
    expect(page).to_not have_content('medium')
  end
end
