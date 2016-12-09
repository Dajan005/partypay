class AddZipToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :zip, :integer
  end
end
