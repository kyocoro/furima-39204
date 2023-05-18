class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postcode,       null: false
      t.integer    :region_id,      null: false
      t.string     :municipalities, null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :telephone,      null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
