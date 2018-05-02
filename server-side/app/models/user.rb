class User < ApplicationRecord
    before_create -> {self.token = generate_token}
    has_secure_password
    has_many :drafts, class_name: 'Draft' 
    has_many :ad_items 
    has_many :ads, :through => :ad_items
    has_many :items, :through => :ads
    has_many :orders

    private

    def generate_token
        loop do
            token = SecureRandom.hex
            return token unless User.exists?({token: token})
        end
    end
end
