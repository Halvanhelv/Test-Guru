class AddTestPassagesBadgesReceived < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, 'received', :boolean, default: false
  end
end
