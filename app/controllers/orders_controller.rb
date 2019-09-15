class OrdersController < ApplicationController

    def new
        @user_cart_items = current_user.cart_items

        #ユーザーの発送先を送る
        @addresses = []
        user_address = current_user.address
        @address.push(user_address)
        user_shopping_addresses = current_user.shopping_addresses
        user_shopping_addresses.each do |shopping_address|
            @address.push(shopping_address.shopping_addresses_address)
        end

		#合計金額の計算
        @total_price = 0
        @user_cart_items.each do |cart_item|
            @total_price += cart_item.quantity * cart_item.item.price
        end
    end

    def confirm_post
    end

    def confirm_get
    end

    def done
    end
end
