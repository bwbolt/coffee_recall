require 'rails_helper'

RSpec.describe 'lots#index', type: :feature do
  it 'shows all lot names' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    visit '/lots'
    expect(page).to have_content(lot1.name)
  end

  it 'shows record in order of recently created and has that date next to it' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    lot2 = Lot.create!(name: 'guatamala', importer: 'lamanita', lot_number: 22, organic: true)
    visit '/lots'
    expect(lot2.name).to appear_before(lot1.name)
    expect(page).to have_content(lot1.created_at)
  end

  it 'has a link to it from every page' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    uris = ['/', '/lots', '/lots/new', "/lots/#{lot1.id}", "/lots/#{lot1.id}/edit", "/lots/#{lot1.id}/bags", '/bags',
            "/bags/#{bag.id}", "/bags/#{bag.id}/edit", "/lots/#{lot1.id}/bags/new"]
    uris.each do |uri|
      visit uri
      expect(page).to have_link('Lots')
    end
  end

  it 'has a delete lot feature' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    visit '/lots'
    expect(page).to have_content('honduras')
    expect(page).to have_link('Delete Lot')
    click_on('Delete Lot')
    expect(current_path).to eq('/lots')
    expect(page).to_not have_content('honduras')
  end

  it "has a 'sort by bags' button that works" do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    lot2 = Lot.create!(name: 'brazil', importer: 'sweet marias', lot_number: 44, organic: true)
    visit '/lots'
    expect('brazil').to appear_before('honduras')
    expect(page).to have_link('Sort by number of bags')
    click_link 'Sort by number of bags'
    expect(current_path).to eq('/lots')
    expect('honduras').to appear_before('brazil')
  end

  it 'has a working Search by name (exact match) field' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    lot2 = Lot.create!(name: 'brazil', importer: 'sweet marias', lot_number: 44, organic: true)
    visit '/lots'
    fill_in 'exact_match', with: 'honduras'
    click_on 'Search for exact match'
    expect(current_path).to eq('/lots')
    expect(page).to have_content('honduras')
    expect(page).to_not have_content('brazil')
  end

  it 'has a working Search by name (partial match) field' do
    lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
    bag = lot1.bags.create!(name: 'medium', ground: true, size: 340)
    lot2 = Lot.create!(name: 'brazil', importer: 'sweet marias', lot_number: 44, organic: true)
    visit '/lots'
    fill_in 'similar', with: 'Hon'
    click_on 'Search for similar match'
    expect(current_path).to eq('/lots')
    expect(page).to have_content('honduras')
    expect(page).to_not have_content('brazil')
  end
end
