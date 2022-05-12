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
end
