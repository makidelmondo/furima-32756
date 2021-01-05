class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title,   null: false
      t.text :explanation, null: false
      t.integer :category_id, null:false
      t.integer :status_id, null:false
      t.integer :shipping_fee_id, null:false
      t.integer :state_id, null:false
      t.integer :shipping_date_id, null:false
      t.integer :price, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
