class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code, null: false, default: ''
      t.integer :percentage_off, default: 0
      t.references :product, null: false, foreign_key: true
      t.date :expiry_date

      t.timestamps
    end
  end
end
