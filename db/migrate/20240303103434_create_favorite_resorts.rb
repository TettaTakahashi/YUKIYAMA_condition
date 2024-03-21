class CreateFavoriteResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_resorts do |t|
      
      t.references :customer, foreign_key: true
      t.references :ski_resort, foreign_key: true
      
      t.timestamps
    end
    
    add_index :favorite_resorts, [:customer_id, :ski_resort_id], unique: true
  end
end
