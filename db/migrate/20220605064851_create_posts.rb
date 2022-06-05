class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.integer :movie_id
      t.string :review_title
      t.text :review_body
      t.float :rate
      t.integer :watched_year
      t.integer :watched_month
      t.integer :watched_day
      t.integer :way_to_watch, default: 0
      t.boolean :spoiler, default: false
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
