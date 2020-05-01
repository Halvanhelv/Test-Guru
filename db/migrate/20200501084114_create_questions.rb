class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.integer :test_id, null: false
      t.references :tests, foreign_key: true, null: false
      t.timestamps
    end
  end
end
