class BagsController < ApplicationController
  def index
    @bags = Bag.where(ground: true)
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

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    bag = Bag.find(params[:id])
    bag.update({
                 roast: params[:roast],
                 size: params[:size],
                 ground: params[:ground]
               })
    bag.save

    redirect_to "/bags/#{bag.id}"
  end
end
