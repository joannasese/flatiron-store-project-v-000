class CartsController < ApplicationController
  #testing git magic

  def show
    @cart = Cart.find(params[:id])
  end
end
