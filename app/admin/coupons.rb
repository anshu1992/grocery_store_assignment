ActiveAdmin.register Coupon do
  permit_params :code, :percentage_off, :product_id, :expiry_date
end
