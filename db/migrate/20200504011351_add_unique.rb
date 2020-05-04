class AddUnique < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, :title, unique: true
    add_index :tests, %i[title level], unique: true
  end
end
