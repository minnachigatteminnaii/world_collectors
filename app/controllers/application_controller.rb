class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @search = Item.where(listing_stop: 0).page(params[:page]).ransack(params[:q])
        @items = @search.result
    end


    def after_sign_in_path_for(resource)
        root_path(resource)
    end

end
