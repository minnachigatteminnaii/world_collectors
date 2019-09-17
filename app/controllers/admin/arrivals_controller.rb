class Admin::ArrivalsController < ApplicationController
    def new 
        @arrival = Arrival.new
    end     

    def create
        @arrival = Arrival.new(arrrival_params)
        @arrival.save!
        #入荷時に商品の販売ステータスを変更する
        status = @arrival.item.sales_management 
        if status == "soldout"
            @arrival.item.update_attributes(sales_management: 1)
        end
        redirect_to admin_items_url
    end

    private
     def arrrival_params
        params.require(:arrival).permit(:arrival_date, :quantity, :item_id)
     end
end
