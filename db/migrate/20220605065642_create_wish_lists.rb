class CreateWishLists < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_lists do |t|
      t.integer :customer_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
