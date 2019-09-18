class Admin::OrdersController < ApplicationController

    def index
        @receives = Order.all
    end

    def show
        @receive = Order.find(params[:id])
    end
end
