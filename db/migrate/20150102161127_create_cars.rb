class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :manufacturer_id, null: false
      t.string :color, null: false
      t.string :year, null: false
      t.text :description

      t.timestamps
    end
  end
end
