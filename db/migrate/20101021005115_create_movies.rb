class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :officialurl
      t.string :imageurl
      t.string :amazonurl
      t.integer :rating
      t.string :studio
      t.string :format

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
