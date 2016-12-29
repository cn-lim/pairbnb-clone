class AddVerificationToListings < ActiveRecord::Migration
  def change
     add_column :listings, :verification_status, :integer, :default => 0
  end
end
