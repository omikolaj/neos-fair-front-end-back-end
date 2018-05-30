class Api::AdsController < ApplicationController
    
    def pay
        user = User.find_by(:id=>params[:userID])
        price = params[:price]
        adID = params[:adID]
        if user
            if !user.ads.find_by(:id=> adID)
                if user.new_purchase?(adID)
                    if user.can_afford?(price)
                        user.adjust_wallet(price)
                        user.create_new_order(adID)  
                        Ad.set_to_sold(adID)                                      
                        render json: {success: "You have successfully purchased your item", status: 200}, status: 200     
                    else
                        render json: {fail: "You do not have enough money to purchase this item", status: 401}, status: 401
                    end
                else
                    render json: {fail: "You have already purchased this item", status: 401}, status: 401
                end
            else
                render json: {fail: "You cannot buy your own item", status: 401}, status: 401
            end
            
        else
            render json: {fail: "Something went wrong...", status: 401}, status: 401
        end        
    end
    
    def index        
        if authenticate_request!
            if user = User.find_by(:id => params[:user_id])
                ads = user.ads.where('sold = ?', false).order('published ASC')
                render json: {ads: ads, status: 200}, status: 200
            else
                ads = Ad.where("published = ? AND sold = ?", true, false)
                newAds = serialize_ads(ads) 
                render json: {ads:newAds, status: 200}, status: 200 # Non-Authoritative Information
            end
        else
            render json: {fail: "Unauthorized Request", status: 401}, status: 401
        end
    end

    def show
        ad = Ad.find_by_id(params[:id])
        render json: ad, status: 200
    end

    def create
        binding.pry
        a = nil
        if a #authenticate_request!
            ad = Ad.new(ad_params)
            if ad.save
                render json: { :success => "You're add has been successfully posted", :id => ad.id, status: 201 }, status: 201 # Created
            else
                binding.pry
                render json: { :fail => "Something went wrong.", :validations => ad.errors.full_messages, :status=> 400}, status: 400 # Bad Request
            end
        else
            render json: { :fail => "Unauthorized request", :validations => [], :status=> 401}, status: 401
        end
    end

    def update
        if ad = User.find_by(:id => params[:user_id]).ads.find_by(:id=>params[:id])
            ad.update_attributes!(:published => !ad.published)
            ad = {:id => ad.id, :ad_item_id => ad.ad_item_id, :description => ad.description, :title => ad.title, :published => ad.published}
            render json: {:success => "Successfully updated ad's status", ad: ad, status: 200}, status: 200
        else
            render json: {:fail => 'User or ad were not found', :validations => ad.errors.full_messages, :status=>400}, status: 400
        end
    end

    def destroy
        if ad = User.find_by(:id=>params[:user_id]).ads.find_by(:id=>params[:id])
            removed_ad_id = ad.id
            ad.destroy
            render json: {:success => "Ad successfully deleted", :removed_ad_id => removed_ad_id, status: 200}, status: 200
        else
            render json: {:fail => "Ad cannot be deleted", status: 400}, status: 400
        end
    end

    private
    def ad_params
        params.require(:ad).permit(:id, :price, :auth, :title, :description, :user_id, :ad_item_attributes => [:price], :user_attributes => [:id], :item_attributes => [:title, :condition], :category_attributes => [:name])
    end

    def serialize_ads(ads)
        newAds = []
        ads.each do |ad|
            ad = {title: ad.title, description: ad.description, id: ad.id, published: ad.published, type: ad.type, ad_item: ad.ad_item, category: ad.category, item: ad.item, user: ad.user}
            newAds.push(ad)
        end
        newAds
    end

end