class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :ad_item_id
      t.string :title

      t.timestamps
    end
  end
end
