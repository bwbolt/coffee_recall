require 'rails_helper'

RSpec.describe 'bags#show', type: :feature do
  it 'shows a specific bag and its attributes' do
    bag = Bag.create!(roast: 'medium', ground: true, size: 340)
    visit "/bags/#{bag.id}"
    expect(page).to have_content(bag.roast)
    expect(page).to have_content(bag.ground)
    expect(page).to have_content(bag.size)
    expect(page).to have_content(bag.id)
    expect(page).to have_content(bag.created_at)
    expect(page).to have_content(bag.updated_at)
  end
end
