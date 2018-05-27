class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.integer :ad_item_id
      t.string :type
      t.string :description
      t.string :title
      t.boolean :published, default: true
      t.boolean :sold, default: false

      t.timestamps
    end
    add_index :ads, [:type, :ad_item_id]
  end
end
