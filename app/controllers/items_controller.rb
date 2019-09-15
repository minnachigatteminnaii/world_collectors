class ItemsController < ApplicationController
    def index
       @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def category
        @category = category.where(category: params[:category_id])
    end
end