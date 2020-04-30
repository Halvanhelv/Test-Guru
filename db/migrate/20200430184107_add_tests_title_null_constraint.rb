# frozen_string_literal: true

class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    rename_column :tests, :name, :title
    add_column(:tests, :category_id, :integer)
    change_column :tests, :category_id, :integer, null: false
    change_column_null(:tests, :title, false) # Запрет на NULL в строке title
  end

  # def up
  #   change_column_null(:tests, :title, false) # Запрет на NULL в строке title
  # end
end
