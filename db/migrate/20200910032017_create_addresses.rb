class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,       null: :false
      t.integer :prefecture_id,  null: :false
      t.stiring :city,           null: :false
      t.string :address,         null: :false
      t.stiring :building
      t.stiring :phone_number,   null: :false
      t.references :purchase,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
