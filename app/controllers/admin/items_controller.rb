class Admin::ItemsController < ApplicationController
    before_action :authenticate_administrator!

    PER = 20

    def index
        @items = Item.where(listing_stop: 0).page(params[:page]).per(PER)

    end

    def show
        @item = Item.find(params[:id])
        #在庫数の計算
        @stock = 0
        @item.arrivals.each do |item_arrival|
            @stock += item_arrival.quantity
        end
        @item.orders_items.each do |order_item|
            @stock -= order_item.quantity
        end
    end

    def new
        @item = Item.new
		@disk = @item.disks.build
        @music = @disk.musics.build
        @artists = Artist.all
        @genres = Genre.all
    end

    def create
        item = Item.new(item_params)
        item.save
        redirect_to admin_items_url
    end

    def edit
        @item = Item.find(params[:id])
        @artists = Artist.all
        @genres = Genre.all
    end

    def update
        @item = Item.find(params[:id])
        @item.update_attributes(item_params)
        redirect_to admin_item_url
    end

    def stop
        @item = Item.find(params[:id])
        @item.update_attributes(listing_stop: 1)
        redirect_to admin_items_url
    end


    private

    def item_params
        params.require(:item).permit(
                :item_name, :artist_id, :label_name, :genre_id, :category, :price, :jacket_image, 
                    disks_attributes: [:id, :name, :_destroy, 
                        musics_attributes: [:id, :song_order, :name, :_destroy]
                    ]
                )
    end
end
