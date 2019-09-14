class CartsController < ApplicationController
    def index
    end

    def create
        @cart_item = current_user.cart_items.build(cart_item_params)
        @cart_item.update_attributes(item_id: params[:item])
        if @cart_item.save
            redirect_to root_url
        else
            redirect_to item_path(params[:item])
        end
    end

    def destroy
    end

    def change
    end


    private

        def cart_item_params
            params.require(:cart_item).permit(:quantity)
        end
end
