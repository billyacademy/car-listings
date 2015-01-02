class AddMileageToCars < ActiveRecord::Migration
  def change
    add_column :cars, :mileage, :integer, null: false
  end
end
