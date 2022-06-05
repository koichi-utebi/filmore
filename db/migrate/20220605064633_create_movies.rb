class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genres
      t.string :poster_path
      t.integer :watched_num
      t.float :rate_ave

      t.timestamps
    end
  end
end
