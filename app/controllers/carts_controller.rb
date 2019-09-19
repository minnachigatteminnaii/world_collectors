class CartsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user_cart_items = current_user.cart_items
        #合計金額の計算
        @total_price = 0
        @user_cart_items.each do |cart_item|
            @total_price += ((cart_item.quantity * cart_item.item.price) * 1.08).floor #1.08
        end
    end

    def create
        @cart_item = current_user.cart_items.build(cart_item_params)
        if @cart_item.save!
            redirect_to root_url
        else
            redirect_to root_url
        end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to carts_url
    end

    def change
        @cart_item = CartItem.find(params[:id])
        @cart_item.update_attributes(cart_item_params)
        redirect_to carts_url
    end


    private

        def cart_item_params
            params.require(:cart_item).permit(:item_id, :quantity)
        end
end
