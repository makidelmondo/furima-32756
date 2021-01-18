class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :zip_code,        null: false
      t.integer :state_id,       null: false
      t.string :city,            null: false
      t.string :street,          null: false
      t.string :apartment
      t.string :telephone,       null: false
      t.references :deal_record, foreign_key: true
      t.timestamps
    end
  end
end
