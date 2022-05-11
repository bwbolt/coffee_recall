require 'rails_helper'

RSpec.describe 'lots#show', type: :feature do
  it 'shows information about the particular lot' do
    lot1 = Lot.create!(name: 'honduras', lot_number: 55, organic: false)
    visit "/lots/#{lot1.id}"
    expect(page).to have_content(lot1.name)
  end
end
