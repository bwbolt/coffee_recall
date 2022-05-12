class Lot < ApplicationRecord
  has_many :bags, dependent: :destroy
end
