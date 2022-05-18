require 'rails_helper'

RSpec.describe 'welcome#index' do
  it 'displays a welcome message' do
    visit '/'
    expect(page).to have_content('Coffee Recall Portal')
  end
end
