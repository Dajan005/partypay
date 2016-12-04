class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps

    end
  end
end
