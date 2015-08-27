module Admin
  class BidsController < ApplicationController
    layout "dashboard"

    def index
      @bids = Bid.most_recent
    end
  end
end
