class Bag < ApplicationRecord
  validates_presence_of :roast, :size

  belongs_to :lot
end
