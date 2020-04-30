class AddLevelToTests < ActiveRecord::Migration[6.0]
  def change
    change_column(:tests, :level, :integer, default: 0)
  end
end
