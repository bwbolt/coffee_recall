require 'rails_helper'

describe Bag, type: :model do
  describe 'validations' do
    it { should validate_presence_of :roast }
    it { should validate_presence_of :size }
  end

  describe 'relationships' do
    it { should belong_to :lot }
  end
end
