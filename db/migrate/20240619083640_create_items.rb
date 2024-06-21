class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :starting_price
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :minimum_selling_price

      t.timestamps
    end
  end
end
