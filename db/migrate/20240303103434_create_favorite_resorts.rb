class CreateFavoriteResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_resorts do |t|
      t.integer :ski_resort_id, null: false
      t.integer :customer_id, null:false

      t.timestamps
    end
  end
end
