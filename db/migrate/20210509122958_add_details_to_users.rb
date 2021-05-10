class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :phone_number, :string, null: false, default: ''
    add_column :users, :birthdate, :date
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end
end
