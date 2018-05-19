# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:name => 'Oskar Miko', :email =>'osk@gmail.com', :password => "password", :username=>"TheBetterKind")

AdItem.create(:user_id => 1, :price=>100, :post_date=>DateTime.now.to_date)

# AdItem.create(:user_id => 2, :price=>300)

# AdItem.create(:user_id => 1, :price=>350)

Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 1)

# Item.create(:title => "G.I. Joe", :ad_item_id => 3)

Ad.create(:ad_item_id => 1,:description => "My First Ad Description", :title => "Selling awesome stuff", :published => false)

# Ad.create(:ad_item_id => 3,:description => "Another One Bites", :title => "Best Ad Ever", :published => false)

# Ad.create(:ad_item_id => 4,:description => "One Bites", :title => "Ad Ever", :published => false)

Category.create(:ad_item_id => 1, :name => "Toys")

Order.create(:ad_item_id => 1, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
