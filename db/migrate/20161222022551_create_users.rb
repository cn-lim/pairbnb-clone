class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
 
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone
      t.date   :born
      t.integer :gender, default: 0
      t.integer :listing_id
      t.integer :review_id
      t.integer :transaction_id
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      t.timestamps null: false

    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
