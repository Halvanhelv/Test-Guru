class Test < ApplicationRecord
  # has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users #нужно что бы проходило через модель tests_user а не напрямую в модель user. з
  def self.test_sort(name)
    Test.joins('join categories on categories.id = tests.category_id')
        .where('categories.title = ?', name).order(title: :desc).pluck(:title)
  end
end
