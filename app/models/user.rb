# frozen_string_literal: true

class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         # :trackable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         authentication_keys: [:login] # можно указать и в config/initializers/devise.rb

  has_many :test_passages # цепляет  все строки из tests_users
  has_many :tests, through: :test_passages # а это уже позволяет по по пойманным строкам искать нужное в таблице users,  # прямой связи с таблицей tests у меня нет и потому используется данная конструкция
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id' # вместо :tests_author можно указать что будет удобнее, показывает тесты автора
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :login, presence: true, uniqueness: true





  def user_results(level)
    tests.where('level = ?', level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
