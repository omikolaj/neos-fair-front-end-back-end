class Api::AdsController < ApplicationController
    
    def index
        ads = Ad.all
        render json: ads, status: 200
    end

    def show
        ad = Ad.all.first
        render json: ad, status: 200
    end

    def create
        binding.pry
    end

    def update
        binding.pry
    end   

end