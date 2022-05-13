class LotsController < ApplicationController
  def index
    @lots = Lot.all.sort_by { |lot| lot.created_at }.reverse
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
    @bags = Bag.where(lot_id: params[:id])
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
    if params[:sort] == 'name' && !params[:size].nil?
      @lot = Lot.find(params[:id])
      @bags = Bag.where(lot_id: params[:id]).where("size >= #{params[:size].to_i}").sort_by { |bag| bag.roast }
    elsif !params[:size].nil?
      @lot = Lot.find(params[:id])
      @bags = Bag.where("size >= #{params[:size].to_i}").where(lot_id: params[:id])
    elsif params[:sort] == 'name'
      @lot = Lot.find(params[:id])
      @bags = Bag.where(lot_id: params[:id]).sort_by { |bag| bag.roast }
    else
      @lot = Lot.find(params[:id])
      @bags = Bag.where(lot_id: params[:id])
    end
  end
end
