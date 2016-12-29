class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.string :description 
      t.string :address, null: false
      t.string :country_code, null: false
      t.string :room_type, null: false
      t.integer :num_of_room, null: false
      t.integer :max_guests, null: false
      t.integer :price, null: false
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
