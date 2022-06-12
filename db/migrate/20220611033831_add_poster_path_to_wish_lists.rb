class AddPosterPathToWishLists < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :poster_path, :string
    add_column :wish_lists, :title, :string
  end
end
