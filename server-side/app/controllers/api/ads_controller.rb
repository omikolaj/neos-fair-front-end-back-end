class Api::AdsController < ApplicationController
    
    def index

    end

    def show
        ad = Ad.all.first
        render json: ad, status: 200
    end

end