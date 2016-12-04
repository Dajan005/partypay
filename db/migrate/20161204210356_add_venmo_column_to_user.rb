class AddVenmoColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Venmo, :string
  end
end
