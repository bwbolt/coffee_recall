require 'rails_helper'

RSpec.describe 'lots#index', type: :feature do
  it 'shows all lot names' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    visit '/lots'
    expect(page).to have_content(lot1.name)
  end

  it 'shows record in order of recently created and has that date next to it' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    lot2 = Lot.create!(name: 'guatamala', lot_number: 22, organic: true)
    visit '/lots'
    expect(lot2.name).to appear_before(lot1.name)
    expect(page).to have_content(lot1.created_at)
  end
end
