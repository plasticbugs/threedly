class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :officialurl
      t.string :imageurl
      t.string :amazonurl
      t.integer :rating
      t.string :console
      t.string :publisher
      t.string :developer
      t.date :releasedate
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
