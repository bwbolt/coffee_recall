class BagsController < ApplicationController
  def index
    @bags = %w[bag1 bag2 bag3]
  end
end
