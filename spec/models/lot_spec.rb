require 'rails_helper'

RSpec.describe Lot, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :lot_number }
    it { should validate_presence_of :importer }
  end
  describe 'relationships' do
    it { should have_many :bags }
  end
  describe 'methods' do
    it 'can count the number of associated bags' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
      bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot1.id)
      expect(lot1.bag_count).to eq(2)
    end
    it 'can sort bags by name (roast)' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = Bag.create!(roast: 'medium', ground: true, size: 340, lot_id: lot1.id)
      bag2 = Bag.create!(roast: 'dark', ground: true, size: 60, lot_id: lot1.id)
      expect(lot1.bags_larger_than(70)).to eq([bag1])
    end
  end
end
