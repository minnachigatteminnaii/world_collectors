class ItemsController < ApplicationController
    def index
       @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = current_user.cart_items.build
        #在庫数の計算
        @stock = 0
        @item.arrivals.each do |item_arrival|
            @stock += item_arrival.quantity
        end
        @item.orders_items.each do |order_item|
            @stock -= order_item.quantity
        end
    end

    def category
        @category = category.where(category: params[:category_id])
    end
end