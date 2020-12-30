# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: 'Неуникальное значение уровня и названия теста' }
  scope :easy, -> { where(level: (0..1)) }
  scope :middle, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  scope :sort_category, lambda { |category|
                          joins(:category)
                            .where(categories: { title: category })
                        }

  def self.test_sort(name)
    sort_category(name).order(title: :desc).pluck(:title)
  end
end
