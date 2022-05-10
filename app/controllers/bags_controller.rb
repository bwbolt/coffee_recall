class BagsController < ApplicationController
  def index
    @bags = Bag.all
  end

  def show
    @bag = Bag.find(params[:id])
  end
end
