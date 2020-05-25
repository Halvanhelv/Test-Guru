# frozen_string_literal: true

class TestQuestionsCascadeDelete < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :questions, :tests

    add_foreign_key :questions, :tests, on_delete: :cascade, null: false
  end
end
