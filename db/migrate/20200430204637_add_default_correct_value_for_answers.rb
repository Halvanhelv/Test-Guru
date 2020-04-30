class AddDefaultCorrectValueForAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column(:answers, :correct, :boolean, default: 0)
  end
end
