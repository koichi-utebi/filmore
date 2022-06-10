class RemoveAvgRateFromWatchedList < ActiveRecord::Migration[6.1]
  def change
    remove_column :watched_lists, :avg_rate, :float
  end
end
