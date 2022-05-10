class LotsController < ApplicationController
  def index
    @lots = %w[lot1 lot2 lot3]
  end
end
