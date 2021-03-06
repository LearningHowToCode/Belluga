class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :format
      t.string :location
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
