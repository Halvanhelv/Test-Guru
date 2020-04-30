# frozen_string_literal: true

class AddCategoryTitle < ActiveRecord::Migration[6.0]
  def change
    add_column(:categories, :title, :string)
    change_column_null(:tests, :title, false)
  end
end
