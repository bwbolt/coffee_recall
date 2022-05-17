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
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      expect(lot1.bag_count).to eq(2)
    end
    it 'can sort bags by name (name)' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      expect(lot1.bags_larger_than(70)).to eq([bag1])
    end
    it 'can sory by bag count' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      lot2 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag3 = lot2.bags.create!(name: 'medium', ground: true, size: 340)
      expect(Lot.sort_by_bag_count).to eq([lot1, lot2])
    end
    it 'can sort by creation date' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'medium', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      lot2 = Lot.create!(name: 'guat', importer: 'lamanita', lot_number: 55, organic: false)
      bag3 = lot2.bags.create!(name: 'medium', ground: true, size: 340)
      lot2.update(created_at: Date.yesterday)
      expect(Lot.sort_by_creation_date).to eq([lot1, lot2])
    end
    it 'can sort associated bags by name' do
      lot1 = Lot.create!(name: 'honduras', importer: 'lamanita', lot_number: 55, organic: false)
      bag1 = lot1.bags.create!(name: 'a', ground: true, size: 340)
      bag2 = lot1.bags.create!(name: 'dark', ground: true, size: 60)
      bag3 = lot1.bags.create!(name: 'a', ground: true, size: 60)
      expect(lot1.bags_sorted_by_name).to eq([bag1, bag3, bag2])
    end
  end
end
