# frozen_string_literal: true

class TestPassageComplited < ActiveRecord::Migration[6.0]
  def change
    add_column(:test_passages, :complited, :integer, default: 0)
  end
end
