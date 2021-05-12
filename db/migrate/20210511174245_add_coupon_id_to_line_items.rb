class AddCouponIdToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :coupon_id, :integer, index: true
  end
end
