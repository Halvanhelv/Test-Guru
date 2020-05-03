class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests_author, class_name: 'Test', foreign_key: 'author_id'
  def user_results(level)
    Test.joins('join results on tests.id = results.test_id')
        .where('results.user_id = ? and tests.level = ?', self.id, level)
  end
end
