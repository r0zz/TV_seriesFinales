class CreateFinaleRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :finale_ratings do |t|
      t.string :series
      t.decimal :viewership
      t.decimal :householdrating
      t.integer :share
      t.date :date
      t.string :network

      t.timestamps
    end
  end
end
