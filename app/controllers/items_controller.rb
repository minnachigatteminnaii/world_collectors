class ItemsController < ApplicationController


    def index
    #    @items = Item.all
    @item_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = current_user&.cart_items&.build
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
        @continent = params[:category_id]
        @category = Item.where(category: params[:category_id]).where(listing_stop: 0)
    end

  def check_login
    redirect_to logout_path if current_user && current_user.active_flag != 'active'
  end
end