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
    lot.update(lots_params)
    lot.save
    redirect_to "/lots/#{lot.id}"
  end

  def destroy
    Lot.destroy(params[:id])
    redirect_to '/lots'
  end

  private

  def lots_params
    params.permit(:name, :lot_number, :importer, :organic)
  end
end
