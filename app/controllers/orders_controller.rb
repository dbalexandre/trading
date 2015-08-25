class OrdersController < ApplicationController
  layout "dashboard"

  def new
    @bid = Bid.find(params[:bid_id])
    @order = current_user.orders.build
  end

  def create
    @bid = Bid.find(params[:bid_id])
    @order = current_user.orders.build(bid: @bid)

    if @order.save
      redirect_to bids_path, notice: "Compra realizada com sucesso."
    else
      render :new
    end
  end
end
