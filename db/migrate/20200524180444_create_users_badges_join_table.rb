# frozen_string_literal: true

class CreateUsersBadgesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
    end
  end
end
