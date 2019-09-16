class Admin::ArrivalsController < ApplicationController
    def new 
        @arrival = Arrival.new
    end     
end
