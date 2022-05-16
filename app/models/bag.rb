class Bag < ApplicationRecord
  validates_presence_of :name, :size

  belongs_to :lot
end
