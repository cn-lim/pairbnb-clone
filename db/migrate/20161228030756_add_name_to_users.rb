class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true

  end


end
