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
    Bag.create(bags_params)
    redirect_to "/lots/#{params[:id]}/bags"
  end

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    bag = Bag.find(params[:id])
    bag.update(bags_params)
    bag.save
    redirect_to "/bags/#{bag.id}"
  end

  def destroy
    Bag.destroy(params[:id])
    redirect_to '/bags'
  end

  private

  def bags_params
    params.permit(:name, :ground, :size, :lot_id)
  end
end
