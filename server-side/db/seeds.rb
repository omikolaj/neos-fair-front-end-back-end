# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(:name => 'Oskar Miko', :email =>'osk@gmail.com', :password => "password", :username=>"TheBetterKind")

AdItem.create(:user_id => 1, :price=>10, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>20, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>30, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>40, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>50, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>60, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>70, :post_date=>DateTime.now.to_date)


Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 1)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 2)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 3)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 4)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 5)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 6)
Item.create(:title => "Barbie", :condition=>"used",:ad_item_id => 7)


Ad.create(:ad_item_id => 1,:description => "My First Ad Description", :title => "Selling awesome stuff", :published => true)
Ad.create(:ad_item_id => 2,:description => "My First Ad Description1", :title => "Selling awesome stuff1", :published => true)
Ad.create(:ad_item_id => 3,:description => "My First Ad Description2", :title => "Selling awesome stuff2", :published => true)
Ad.create(:ad_item_id => 4,:description => "My First Ad Description3", :title => "Selling awesome stuff3", :published => true)
Ad.create(:ad_item_id => 5,:description => "My First Ad Description4", :title => "Selling awesome stuff4", :published => true)
Ad.create(:ad_item_id => 6,:description => "My First Ad Description5", :title => "Selling awesome stuff5", :published => true)
Ad.create(:ad_item_id => 7,:description => "My First Ad Description6", :title => "Selling awesome stuff6", :published => true)


Category.create(:ad_item_id => 1, :name => "Toys")
Category.create(:ad_item_id => 2, :name => "Toys")
Category.create(:ad_item_id => 3, :name => "Toys")
Category.create(:ad_item_id => 4, :name => "Toys")
Category.create(:ad_item_id => 5, :name => "Toys")
Category.create(:ad_item_id => 6, :name => "Toys")
Category.create(:ad_item_id => 7, :name => "Toys")

Order.create(:ad_item_id => 1, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 2, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 3, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 4, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 5, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 6, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
Order.create(:ad_item_id => 7, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
