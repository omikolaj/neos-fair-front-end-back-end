class Api::AdsController < ApplicationController
    
    def index
        ads = Ad.all
        render json: ads, status: 203 # Non-Authoritative Information
    end

    def show
        ad = Ad.all.first
        render json: ad, status: 203
    end

    def create
        @ad = Ad.new(ad_params)
        binding.pry
        if @ad.save
            render json: { :success => "You're add has been successfully posted" }, status: 201 # Created
        else
            binding.pry
        end
    end

    def update
        binding.pry
    end

    private
    def ad_params
        params.require(:ad).permit(:title, :description, :ad_item_attributes => [:price], :user_attributes => [:email], :item_attributes => [:title, :condition], :category_attributes => [:name])
    end

end