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
    left_joins(:bags).group(:id).order('COUNT(bags.id) DESC')
  end

  def self.sort_by_creation_date
    order(created_at: :desc)
  end

  def bags_sorted_by_name
    bags.order('lower(name)')
  end

  def self.name_exactly_like(word)
    where(name: word)
  end

  def self.name_partially_like(word)
    where('lower(name) LIKE?', "%#{word.downcase}%")
  end
end
