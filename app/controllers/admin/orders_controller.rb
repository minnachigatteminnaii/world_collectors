class Admin::OrdersController < ApplicationController
    before_action :authenticate_administrator!


    def index
        @receives = Order.all
    end

    def show
        @receive = Order.find(params[:id])
    end

    def change
        @recieve = Order.find(params[:id])
        if @recieve.update_attributes(status: params[:status])
            redirect_to admin_orders_path
        else
            render 'index'
        end
    end
end
