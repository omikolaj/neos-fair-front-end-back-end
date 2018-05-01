class CreateAdItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_items do |t|
      t.integer :user_id  
      t.money :price
      t.datetime :post_date 

      t.timestamps
    end
  end
end
