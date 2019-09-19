class Admin::OrdersController < ApplicationController
    before_action :authenticate_administrator!


    def index
        @receives = Order.all
    end

    def show
        @receive = Order.find(params[:id])
    end
end
