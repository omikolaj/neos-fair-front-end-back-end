class Api::AdsController < ApplicationController
    
    def index

    end

    def show
        ad = Ad.all.first
        render json: ad, status: 200
    end

    def new

    end

    def create

    end

    def update

    end

    def edit

    end    

end