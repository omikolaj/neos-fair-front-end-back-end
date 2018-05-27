class User < ApplicationRecord
    before_create -> {self.token = generate_token}
    before_save :downcase_email
    has_secure_password
    has_many :drafts, class_name: 'Draft' 
    has_many :ad_items 
    has_many :ads, :through => :ad_items
    has_many :items, :through => :ads
    has_many :orders
    validates :email, presence: true
    validates_uniqueness_of :email, case_sensitive: false
    # validates_format_of :email, with /@/
    validates :password, :length => {:within=>6..100}, :presence => true, unless: :oauth
    validates :username, presence: true
    validates_uniqueness_of :username, case_sensitive: false
    validates :name, presence: true
    # validates :last_name, presence: true
    include FormatPrice

    def new_purchase?(adID)
        ad = Ad.find_by(:id=>adID)
        self.orders.find_by(:ad_item_id=>ad.ad_item_id) ? false : true
    end

    def can_afford?(price)
        format_f(self.wallet).to_f.round(2) >= price.to_f.round(2)
    end

    def adjust_wallet(price)
        remaining = format_f(self.wallet).to_f.round(2) - price.to_f.round(2)
        self.update_attribute(:wallet, BigDecimal.new("#{remaining}"))
    end

    def create_new_order(adID)
        self.orders.create!(:ad_item_id => Ad.find_by(:id => adID).ad_item.id)
        
    end

    def self.find_or_create_by_oauth(user_info)
        self.where(:uid => user_info["id"]).first_or_create do |user|
            user.email = user.set_github_email(user_info)
            user.password = SecureRandom.hex
            user.name = user.set_github_name(user_info)
            user.username = user_info["login"]
            user.oauth = true
        end
    end
    
    def set_github_email(info)
        info["email"].nil? ? "#{info["login"]}@email.com" : info["email"]
    end

    def set_github_name(info)
        info["name"].nil? ? "#{info["login"]}" : info["name"]
    end

    private
    def downcase_email
        self.email = self.email.delete(" ").downcase
    end

    def generate_token
        loop do
            token = SecureRandom.hex
            return token unless User.exists?({token: token})
        end
    end
end
