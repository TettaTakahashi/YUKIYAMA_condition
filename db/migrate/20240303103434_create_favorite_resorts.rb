class CreateFavoriteResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_resorts do |t|
      
      t.references :customer, null: false
      t.references :ski_resort, null: false
      
      t.timestamps
    end
    
    add_index :favorite_resorts, [:customer_id, :ski_resort_id], unique: true
  end
end
