# frozen_string_literal: true

class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :post_code, :string
    add_column :users, :self_introduction, :string
  end
end
