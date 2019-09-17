class Admin::ArrivalsController < ApplicationController
    def new 
        @arrival = Arrival.new
    end     

    def create
        @arrival = Arrival.new
        @arrival.save
        redirect_to admin_arrivals_url
    end

    private
     def arrrival_params
        params.require(:arrival).permit(:arrival_date, :quantity, :item_id)
     end
end
