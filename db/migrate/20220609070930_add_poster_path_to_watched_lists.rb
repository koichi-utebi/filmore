class AddPosterPathToWatchedLists < ActiveRecord::Migration[6.1]
  def change
    add_column :watched_lists, :poster_path, :string
    add_column :watched_lists, :title, :string
    add_column :watched_lists, :avg_rate, :float
  end
end
