class LotsBagsController < ApplicationController
  def index
    if !params[:size].nil? && params[:size] != ''
      @lot = Lot.find(params[:id])
      @bags = @lot.bags_larger_than(params[:size])
    elsif params[:sort] == 'name'
      @lot = Lot.find(params[:id])
      @bags = @lot.bags_sorted_by_name
    else
      @lot = Lot.find(params[:id])
      @bags = @lot.bags
    end
  end
end
