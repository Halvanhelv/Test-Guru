class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users #цепляет  все строки из tests_users
  has_many :tests, through: :tests_users # а это уже позволяет по по пойманным строкам искать нужное в таблице users
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id' #вместо :tests_author можно указать что будет удобнее
  validates :email, presence: true

  def user_results(level)
    tests.where('level = ?', level)

  end
end
