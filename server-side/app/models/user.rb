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
    validates :password, :length => {:within=>6..100}, :presence => true, unless: :omniauth
    validates :username, presence: true
    validates_uniqueness_of :username, case_sensitive: false
    validates :first_name, :last_name, presence: true
    # validates :last_name, presence: true
    
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
