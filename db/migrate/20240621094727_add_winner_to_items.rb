class AddWinnerToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :winner_id, :integer
    add_index :items, :winner_d
  end
end
