require 'rails_helper'

RSpec.describe 'lots#index', type: :feature do
  it 'shows all lot names' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    visit '/lots'
    expect(page).to have_content(lot1.name)
  end
end
