class RemoveWatchedYearFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :watched_year, :integer
    remove_column :posts, :watched_month, :integer
    remove_column :posts, :watched_day, :integer
  end
end
