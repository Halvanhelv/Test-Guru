# frozen_string_literal: true

class User < ApplicationRecord
  # has_and_belongs_to_many :tests

  has_many :test_passages # цепляет  все строки из tests_users
  has_many :tests, through: :test_passages # а это уже позволяет по по пойманным строкам искать нужное в таблице users,
  # прямой связи с таблицей tests у меня нет и потому используется данная конструкция
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id' # вместо :tests_author можно указать что будет удобнее
  validates :email, presence: true

  def user_results(level)
    tests.where('level = ?', level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
