class Admin::ArrivalsController < ApplicationController
    before_action :authenticate_administrator!

    def index
        @arrivals = Arrival.page(params[:page]).per(20)
    end

    def new 
        @arrival = Arrival.new
    end     

    def create
        @arrival = Arrival.new(arrrival_params)
        if @arrival.save
            #入荷時に商品の販売ステータスを変更する
            status = @arrival.item.sales_management 
            if status == "soldout"
                @arrival.item.update_attributes(sales_management: 1)
            end
            redirect_to admin_items_url
        else
            render 'new'
        end
    end

    def result
    end

    private
     def arrrival_params
        params.require(:arrival).permit(:arrival_date, :quantity, :item_id)
     end
end
