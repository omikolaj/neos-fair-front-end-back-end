# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:name => 'Anders Hejlsberg', :email =>'Anders@neosfair.com', :password => "ABCdefg", :username=>"andersC#")
User.create(:name => 'Brendan Eich', :email =>'brendan@neosfair.com', :password => "password", :username=>"guest")

AdItem.create(:user_id => 1, :price=>100, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>250, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>30, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>1050, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>150, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>390, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>90, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>240, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>40, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>900, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>4000, :post_date=>DateTime.now.to_date)
AdItem.create(:user_id => 1, :price=>6000, :post_date=>DateTime.now.to_date)


Item.create(:title => "Lamp", :condition=>"used",:ad_item_id => 1)
Item.create(:title => "Monitor", :condition=>"new",:ad_item_id => 2)
Item.create(:title => "Baseball Cards", :condition=>"new",:ad_item_id => 3)
Item.create(:title => "Tools", :condition=>"used",:ad_item_id => 4)
Item.create(:title => "Legos", :condition=>"used",:ad_item_id => 5)
Item.create(:title => "Computer Case", :condition=>"used",:ad_item_id => 6)
Item.create(:title => "Desk", :condition=>"used",:ad_item_id => 7)
Item.create(:title => "Fridge", :condition=>"used",:ad_item_id => 8)
Item.create(:title => "Speakers", :condition=>"new",:ad_item_id => 9)
Item.create(:title => "Chair", :condition=>"new",:ad_item_id => 10)
Item.create(:title => "Four Wheeler", :condition=>"used",:ad_item_id => 11)
Item.create(:title => "Chess Set", :condition=>"used",:ad_item_id => 12)


Ad.create(:ad_item_id => 1,:description => "Contemporary Lamp, works great. If it's dark turn it on and its light!", :title => "Great Lamp", :published => true)
Ad.create(:ad_item_id => 2,:description => "One dead pixle in the top right hand corner", :title => "Curved 32 inch Monitor", :published => true)
Ad.create(:ad_item_id => 3,:description => "Never opened old school baseball cards", :title => "Baseball cards for collectors", :published => true)
Ad.create(:ad_item_id => 4,:description => "Mechanic tool set. Nothing is missing. I promise...", :title => "Like new tool set!", :published => true)
Ad.create(:ad_item_id => 5,:description => "Box full of different kinds of legos", :title => "Random Legos in a box", :published => true)
Ad.create(:ad_item_id => 6,:description => "Super awesome computer case from the future", :title => "Just a computer case", :published => true)
Ad.create(:ad_item_id => 7,:description => "My room got smaller, can't fit my desk anymore. Desk is in great shape, made out of oak.", :title => "Selling computer Desk", :published => true)
Ad.create(:ad_item_id => 8,:description => "Few dents here and there but works great!", :title => "Side by side fridge and freezer", :published => true)
Ad.create(:ad_item_id => 9,:description => "Loud and clear speakers. Work like new", :title => "Logitech speakers 5.1", :published => true)
Ad.create(:ad_item_id => 10,:description => "Ergonomics chair with great lumbar support", :title => "Ergonomics, Ergonomics, Ergonomics", :published => true)
Ad.create(:ad_item_id => 11,:description => "Great quad, has four wheels. Drives up and down hills. Needs gas.", :title => "Selling my quad", :published => true)
Ad.create(:ad_item_id => 12,:description => "Chess set found in ancient Mongolia. Perhaps THEE oldest chess set in my house hold", :title => "Incredible Chess Set", :published => true)


Category.create(:ad_item_id => 1, :name => "House Items")
Category.create(:ad_item_id => 2, :name => "Electronics")
Category.create(:ad_item_id => 3, :name => "Other")
Category.create(:ad_item_id => 4, :name => "Tools")
Category.create(:ad_item_id => 5, :name => "Toys")
Category.create(:ad_item_id => 6, :name => "Parts")
Category.create(:ad_item_id => 7, :name => "House Items")
Category.create(:ad_item_id => 8, :name => "Kitchen")
Category.create(:ad_item_id => 9, :name => "Electronics")
Category.create(:ad_item_id => 10, :name => "House Items")
Category.create(:ad_item_id => 11, :name => "Automibiles")
Category.create(:ad_item_id => 12, :name => "Other")

# Order.create(:ad_item_id => 1, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 2, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 3, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 4, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 5, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 6, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
# Order.create(:ad_item_id => 7, :user_id => 1, :old => true, :purchased_date=>DateTime.now.to_date)
