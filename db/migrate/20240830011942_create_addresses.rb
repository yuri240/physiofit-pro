class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :phone_number, null: false
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
