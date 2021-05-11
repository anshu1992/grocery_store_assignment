class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :subtotal

      t.timestamps
    end
  end
end
