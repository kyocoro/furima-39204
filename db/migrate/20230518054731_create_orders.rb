class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :cardnumber,       null: false
      t.string :expiration,       null: false
      t.string :securitycode,     null: false
      t.timestamps
    end
  end
end
