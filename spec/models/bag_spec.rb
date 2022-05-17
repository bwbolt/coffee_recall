require 'rails_helper'

describe Bag, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :size }
  end

  describe 'relationships' do
    it { should belong_to :lot }
  end

  describe 'methods' do
    it 'can return all lots with exact name matches' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      lot2 = Lot.create!(name: 'guat', importer: 'lamanita', lot_number: 55, organic: false)
      bag3 = lot2.bags.create!(name: 'medium', ground: true, size: 340)
      expect(Bag.name_exactly_like('dark')).to eq([bag2])
    end

    it 'can return all lots with similar name matches' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      lot2 = Lot.create!(name: 'guat', importer: 'lamanita', lot_number: 55, organic: false)
      bag3 = lot2.bags.create!(name: 'medium', ground: true, size: 340)
      expect(Bag.name_partially_like('me')).to eq([bag1, bag3])
    end
  end
end
