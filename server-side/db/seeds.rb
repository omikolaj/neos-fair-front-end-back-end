# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:first_name => 'Oskar', :last_name => 'Mikolajczyk', :email =>'osk@gmail.com')

AdItem.create(:user_id => 1, :price=>100)

Item.create(:title => "Barbie", :ad_item_id => 1)

Ad.create(:ad_item_id => 1,:description => "My First Ad Description", :title => "TITLE", :published => false)

Category.create(:ad_item_id => 1, :name => "Toys")

Order.create(:ad_item_id => 1, :user_id => 1, :old => true)
