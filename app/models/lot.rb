class Lot < ApplicationRecord
  validates_presence_of :name, :lot_number, :importer

  has_many :bags, dependent: :destroy

  def bag_count
    bags.count
  end

  def bags_larger_than(size)
    bags.where("size >= #{size}")
  end

  def self.sort_by_bag_count
    all.sort_by { |lot| lot.bag_count }.reverse
  end

  def self.sort_by_creation_date
    order(created_at: :desc)
  end
end
