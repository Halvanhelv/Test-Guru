class QuestionGistsCascadeDelete < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :gists, :questions
    add_foreign_key :gists, :questions, on_delete: :cascade, null: false
  end
end
