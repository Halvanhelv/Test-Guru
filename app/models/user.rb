# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         authentication_keys: [:login]
  has_many :gists
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id'
  has_many :users_badge
  has_many :badges, through: :users_badge
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
