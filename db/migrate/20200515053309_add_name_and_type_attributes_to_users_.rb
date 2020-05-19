# frozen_string_literal: true

class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User', index: true
    add_column :users, :last_name, :string
  end
end
