class CreateFavoriteResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_resorts do |t|
      

      t.timestamps
    end
  end
end
