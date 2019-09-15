class OrdersController < ApplicationController

    def new
        @user_cart_items = current_user.cart_items

        #ユーザーの発送先を送る
        @addresses = []
        user_address = current_user.address
        @addresses.push(user_address)
        user_shopping_addresses = current_user.shopping_addresses
        user_shopping_addresses.each do |shopping_address|
            @addresses.push(shopping_address.shopping_addresses_address)
        end

		#合計金額の計算
        @total_price = 0
        @user_cart_items.each do |cart_item|
            @total_price += cart_item.quantity * cart_item.item.price
        end
    end

    def confirm
        @user_cart_items = current_user.cart_items
        @order = Order.new

        #支払い方法
        @payment_method = params[:payment_methods]

        #発送先住所
        @shopping_address = params[:shopping_address]

        #住所に関連する郵便番号
        if s_address = ShoppingAddress.find_by(shopping_addresses_address: @shopping_address)
            @shopping_postal_code = s_address.delivery_postal
        else
            @shopping_postal_code = current_user.address
        end
    end

    def create
        @order = current_user.orders.build(order_params)
        @order.save
        #購入日時
        @order_date = @order.created_at
        redirect_to order_date_path(@order_date)
    end

    def done
        @order_date = params[:date]
    end


    private

        def order_params
            params.require(:order).permit(:delivery_first_name, :delivery_last_name,
                    :delivery_kana_first, :delivery_kana_last ,:payment_methods, :delivery_postal, 
                    :delivery_address, :delivery_price, :status, :total_price)
        end
end
