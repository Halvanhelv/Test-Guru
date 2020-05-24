# frozen_string_literal: true

class Test < ApplicationRecord
  # has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages # нужно что бы проходило через модель tests_user а не напрямую в модель user. з

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: 'Неуникальное значение уровня и названия теста' }
  scope :easy, -> { where(level: (0..1)) }
  scope :middle, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  scope :sort_category, lambda { |category|
                          joins(:category)
                            .where(categories: { title: category })
                        }

  # Active Record позволяет использовать имена связей, определенных в модели, как ярлыки для определения условия JOIN

  def self.test_sort(name)
    sort_category(name).order(title: :desc).pluck(:title)
  end
end
