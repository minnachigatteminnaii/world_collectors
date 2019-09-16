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
        item.save!
        redirect_to new_admin_item_url
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
