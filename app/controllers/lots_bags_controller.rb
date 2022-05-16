class LotsBagsController < ApplicationController
  def index
    if !params[:size].nil? && params[:size] != ''
      @lot = Lot.find(params[:id])
      @bags = @lot.bags_larger_than(params[:size])
    elsif params[:sort] == 'name'
      @lot = Lot.find(params[:id])
      @bags = @lot.bags.order('lower(name)')
    else
      @lot = Lot.find(params[:id])
      @bags = Bag.where(lot_id: params[:id])
    end
  end
end
