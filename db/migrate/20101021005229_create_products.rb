class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :modelnumber
      t.string :officialurl
      t.string :imageurl
      t.string :amazonurl
      t.integer :rating
      t.integer :category

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
