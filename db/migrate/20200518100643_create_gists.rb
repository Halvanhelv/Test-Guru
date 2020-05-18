class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :link_to_gist

      t.timestamps
    end
  end
end
