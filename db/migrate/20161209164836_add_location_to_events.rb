class AddLocationToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :lat, :decimal
    add_column :events, :long, :decimal
  end
end
