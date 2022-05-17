class LotsController < ApplicationController
  def index
    # binding.pry
    @lots = if params[:sort] == 'number_of_bags'
              Lot.sort_by_bag_count
            elsif !params[:exact_match].nil? && params[:exact_match] != ''
              Lot.name_exactly_like(params[:exact_match])
            elsif !params[:similar].nil? && params[:similar] != ''
              Lot.name_partially_like(params[:similar])
            else
              Lot.sort_by_creation_date
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
