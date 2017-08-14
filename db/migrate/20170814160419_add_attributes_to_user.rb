class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :email, :string
    add_column :users, :phone_number, :string
    add_column :users, :paypal_acount, :string
    add_column :users, :teacher, :boolean
  end
end
