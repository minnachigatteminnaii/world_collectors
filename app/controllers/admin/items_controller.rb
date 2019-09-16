class Admin::ItemsController < ApplicationController

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
        redirect_to new_admin_item_url
    end

    def edit
        @item = Item.find(params[:id])
        @artists = Artist.all
        @genres = Genre.all
    end

    def update
        @item = Item.find(params[:id])
        @item.update_attributes(item_params)
        redirect_to edit_admin_item_url
    end

    def stop
        @item = Item.find(params[:id])
        @item.update_attributes(listing_stop: stop)
        redirect_to admin_items_path
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
