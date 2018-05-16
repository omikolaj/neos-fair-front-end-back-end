class Api::AdsController < ApplicationController
    
    def index
        # binding.pry
        ads = Ad.all        
        render json: ads, status: 203 # Non-Authoritative Information
    end

    def show
        ad = Ad.find_by_id(params[:id])
        render json: ad, status: 203
    end

    def create
        binding.pry
        ad = Ad.new(ad_params)
        if ad.save
            render json: { :success => "You're add has been successfully posted", :id => ad.id, status: 201 }, status: 201 # Created
        else
            render json: { :fail => "Something went wrong.", :validations => ad.errors.full_messages, :status=> 400}, status: 400 # Bad Request
        end
    end

    def update
        binding.pry
    end

    private
    def ad_params
        params.require(:ad).permit(:id, :auth, :title, :description, :ad_item_attributes => [:price], :user_attributes => [:email], :item_attributes => [:title, :condition], :category_attributes => [:name])
    end

end