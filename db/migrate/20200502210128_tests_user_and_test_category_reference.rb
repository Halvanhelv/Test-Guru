class TestsUserAndTestCategoryReference < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :author, foreign_key: { to_table: :users })
    add_reference(:tests, :category, foreign_key: true)
  end
end
