# frozen_string_literal: true

class AddTestsTimer < ActiveRecord::Migration[6.0]
  def change
    add_column(:tests, 'timer', :integer, default: 0)
  end
end
