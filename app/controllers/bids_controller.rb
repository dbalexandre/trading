class BidsController < ApplicationController
  layout "dashboard"

  def index
    @bids = Bid.most_recent.available(current_user)
  end

  def new
    @bid = current_user.bids.build
  end

  def create
    @bid = current_user.bids.build(bid_params)

    if @bid.save
      redirect_to bids_path
    else
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:product, :quantity, :price, :city, :state,
      :payment_type, :number_of_days)
  end
end