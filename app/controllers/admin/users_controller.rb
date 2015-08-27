module Admin
  class UsersController < ApplicationController
    layout "dashboard"

    def index
      @users = User.order(:id)
    end
  end
end
