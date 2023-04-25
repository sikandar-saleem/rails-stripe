class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    
  end

  private

  def customer_params
    params.permit(:name, :email, :phone)
  end

  def card_token_params
    params.permit(:card_number, :exp_year, :exp_month, :cvv)
  end
end