class CartsController < ApplicationController
    def index
        if user_signed_in?
        @user_cart_items = User.first.cart_items   #Userに紐づくCartItemを全て持ってくる(ログイン実装後、User.firstをcurrent_userに変更)
        #合計金額の計算
        @total_price = 0
        @user_items.each do |item|
            @total_price += item.price * item.cart_items(user_id: current_user, item_id: item.id).quantity
        end
    end
    end

    def create
        @cart_item = current_user.cart_items.build(cart_item_params)
        @cart_item.update_attributes(item_id: params[:item])
        if @cart_item.save
            redirect_to root_url
        else
            redirect_to item_url(params[:item])
        end
    end

    def destroy
        #@cart_item = current_user.cart_items.find_by(item_id: params[:id])
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
            params.require(:cart_item).permit(:quantity)
        end
end
