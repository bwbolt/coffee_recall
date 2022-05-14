class Lot < ApplicationRecord
  validates_presence_of :name, :lot_number, :importer

  has_many :bags, dependent: :destroy

  def bag_count
    bags.count
  end

  def bags_larger_than(size)
    bags.where("size >= #{size}")
  end
end
