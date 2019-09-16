class Admin::ItemsController < ApplicationController

    def new
        @item = Item.new
		@disk = @item.disks.build
        @music = @disk.musics.build
        @artists = Artist.all
        @genres = Genre.all
    end


    private

    def item_params
        params.require(:item).permit(
                :item_name, :artist_id, :label_name, :genre_id, :category, :price, :jacket_image,
                    disks_attributes: [:id, :name, :_destroy, 
                        musics_attributes: [:id, :name, :song_order, :_destroy]
                    ]
                )
    end
end
