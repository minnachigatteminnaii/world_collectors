class ItemsController < ApplicationController


    def index
        if params[:category_id]
             @items = Item.where(category: params[:category_id])
         elsif params[:search]
            @items = Item.search
         else

             @items = Item.all
         end
             
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
        @category = Item.where(category: params[:category_id])
    end

  def check_login
    redirect_to logout_path if current_user && current_user.active_flag != 'active'
  end
end