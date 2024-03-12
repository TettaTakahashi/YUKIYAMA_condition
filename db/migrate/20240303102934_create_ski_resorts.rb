class CreateSkiResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :ski_resorts do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.boolean :sales_active, null: false
      t.boolean :snow_active, null: false
      t.string :waiting_time, null: false
      t.integer :price, null: false
      t.string :road_condition, null: false
      t.string :weather, null: false
      t.integer :prefecture_id, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end
  end
end
