# frozen_string_literal: true

class AddUserInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :zip, :integer
    add_column :users, :address, :text
  end
end
