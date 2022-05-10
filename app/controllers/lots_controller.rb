class LotsController < ApplicationController
  def index
    @lots = %w[lot1 lot2 lot3]
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
end
