module Admin
  class OrdersController < ApplicationController
    layout "dashboard"

    def index
      @orders = Order.most_recent
    end
  end
end
