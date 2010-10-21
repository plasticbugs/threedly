class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :author
      t.text :review
      t.string :sitename
      t.string :siteurl
      t.string :imageurl
      t.integer :rating
      t.string :quotable_type
      t.integer :quotable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
