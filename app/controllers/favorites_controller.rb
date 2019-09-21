class FavoritesController < ApplicationController
    before_action :logical_delete_user
    before_action :authenticate_user!

    def index
    end

    def create
        @item = Item.find(params[:item_id])
        current_user.iine(@item)
        respond_to do |format|
            format.html { redirect_to @item }
            format.js { @item }
        end
    end

    def destroy
        @item = Item.find(params[:id])
        current_user.uniine(@item)
        respond_to do |format|
            format.html { redirect_to @item }
            format.js { @item }
        end
    end

end
