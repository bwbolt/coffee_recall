class Bag < ApplicationRecord
  validates_presence_of :name, :size

  belongs_to :lot

  def self.name_exactly_like(word)
    where(name: word)
  end

  def self.name_partially_like(word)
    where('lower(name) LIKE?', "%#{word.downcase}%")
  end
end
