require 'rails_helper'

describe Lot, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :lot_number }
    it { should validate_presence_of :importer }
  end
  describe 'relationships' do
    it { should have_many :bags }
  end
end
