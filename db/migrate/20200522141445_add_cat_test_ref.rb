class AddCatTestRef < ActiveRecord::Migration[6.0]
  def change

    add_reference(:tests,:category, foreign_key: { to_table: :categories })
  end
end
heroku
