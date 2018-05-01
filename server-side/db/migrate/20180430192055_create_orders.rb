class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :ad_item_id
      t.boolean :old
      t.date :purchased_date

      t.timestamps
    end
  end
end
