class BagsController < ApplicationController
  def index
    @bags = Bag.all
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @lot = Lot.find(params[:id])
  end

  def create
    bag = Bag.new({
                    roast: params[:roast],
                    size: params[:size],
                    ground: params[:ground],
                    lot_id: params[:id]
                  })
    bag.save

    redirect_to "/lots/#{params[:id]}/bags"
  end
end
