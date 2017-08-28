class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title, index: true
      t.string :category, index: true
      t.string :picture, index: true
      t.string :location, index: true
      t.string :price, index: true
      t.string :startdate, index: true
      t.string :url, index: true

      t.timestamps
    end
  end
end
