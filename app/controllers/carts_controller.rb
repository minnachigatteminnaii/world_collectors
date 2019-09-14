class CartsController < ApplicationController
    def index
        @user_items = current_user.items   #Userに紐づくItemを全て持ってくる
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
        @cart_item = CartItem.find_by(user_id: current_user.id, item_id: params[:id])
        @cart_item.destroy
        redirect_to carts_url
    end

    def change
        @cart_item = CartItem.find_by(user_id: current_user.id, item_id: params[:id])
        @cart_item.update_attributes(cart_item_params)
        redirect_to carts_url
    end


    private

        def cart_item_params
            params.require(:cart_item).permit(:quantity)
        end
end
