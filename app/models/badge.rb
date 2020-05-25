# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badge
  has_many :users, through: :users_badge
  validates :title, :img, :rule, :value, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
end
