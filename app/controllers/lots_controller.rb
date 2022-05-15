class LotsController < ApplicationController
  def index
    @lots = if params[:sort] == 'number_of_bags'
              Lot.all.sort_by { |lot| lot.bag_count }.reverse
            else
              Lot.order(created_at: :desc)
            end
  end

  def create
    Lot.create(lots_params)
    redirect_to '/lots'
  end

  def show
    @lot = Lot.find(params[:id])
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    lot = Lot.find(params[:id])
    lot.update({
                 name: params[:name],
                 lot_number: params[:lot_number],
                 importer: params[:importer],
                 organic: params[:organic]
               })
    lot.save
    redirect_to "/lots/#{lot.id}"
  end

  def destroy
    Lot.destroy(params[:id])
    redirect_to '/lots'
  end

  def show_children
    if !params[:size].nil? && params[:size] != ''
      @lot = Lot.find(params[:id])
      @bags = @lot.bags_larger_than(params[:size])
    elsif params[:sort] == 'name'
      @lot = Lot.find(params[:id])
      @bags = @lot.bags.order('lower(roast)')
    else
      @lot = Lot.find(params[:id])
      @bags = Bag.where(lot_id: params[:id])
    end
  end

  private

  def lots_params
    params.permit(:name, :lot_number, :importer, :organic)
  end
end
