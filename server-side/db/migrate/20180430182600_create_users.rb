class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :oauth, :default => false
      t.integer :uid, :default => -1
      t.money :wallet, :default => 1000

      t.timestamps
    end
  end
end
