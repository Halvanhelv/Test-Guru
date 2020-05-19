# frozen_string_literal: true

class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :password, if_exists: true
  end
end
