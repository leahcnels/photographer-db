class AddAddressPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :email, :string
  end
end
