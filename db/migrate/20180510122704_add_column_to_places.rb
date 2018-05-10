class AddColumnToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :latitude, :float
    add_column :places, :longtitude, :float
  end
end
