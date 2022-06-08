class AddWatchedDataToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :watched_data, :datetime
  end
end
