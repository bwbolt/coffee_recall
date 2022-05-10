class LotsController < ApplicationController
  def index
    @lots = Lot.all
  end

  def create
    lot = Lot.new({
                    name: params[:name],
                    lot_number: params[:lot_number],
                    importer: params[:importer],
                    organic: params[:organic]
                  })
    lot.save
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
end
