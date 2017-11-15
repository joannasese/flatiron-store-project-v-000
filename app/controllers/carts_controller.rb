class CartsController < ApplicationController
  #testing git magic

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    redirect_to cart_path(@cart)
  end
end
