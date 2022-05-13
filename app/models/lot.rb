class Lot < ApplicationRecord
  validates_presence_of :name, :lot_number, :importer

  has_many :bags, dependent: :destroy
end
