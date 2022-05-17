class BagsController < ApplicationController
  def index
    @bags = if !params[:exact_match].nil? && params[:exact_match] != ''
              Bag.name_exactly_like(params[:exact_match])
            elsif !params[:similar].nil? && params[:similar] != ''
              Bag.name_partially_like(params[:similar])
            else
              Bag.where(ground: true)
            end
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @lot = Lot.find(params[:id])
  end

  def create
    lot = Lot.find(params[:id])
    lot.bags.create(bags_params)
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
    params.permit(:name, :ground, :size)
  end
end
