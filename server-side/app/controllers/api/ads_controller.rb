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
        if @ad.save
            binding.pry
            render json: { :success => "You're add has been successfully posted", :id => @ad.id, status: 201 }, status: 201 # Created
        else
            binding.pry
            render json: { :fail => "Something went wrong.", :validations => @ad.errors.full_messages, :status=> 400}, status: 400 # Bad Request
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