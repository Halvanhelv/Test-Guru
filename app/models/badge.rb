# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badge
  has_many :users, through: :users_badge
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :img, presence: true
  validates :rule, presence: true
  validates :value, presence: true

  def checked(current_user)
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_complited?", current_user, badge.value
        current_user.badges << badge
      end
    end
  end

  def first_try_tests_complited?(user, _value = false)
    user.test_passages.sort_complited.where(test_id: user.test_passages.last.test_id)
  end

  def category_tests_complited?(user, value)
    cat_id = Category.find_by(title: value)
    user_tests_category = user.tests.where(category: cat_id) # все тесты которые проходил пользователь с определенной категорией
    complited_test = user.test_passages.sort_complited.where(received: nil).where(test_id: user_tests_category).group_by(&:test_id) # все тесты которые он удачно прошел
    test_category = Test.where(category: cat_id)
    if (test_category.count == complited_test.count) && (test_category.count != 0 && complited_test.count != 0)
      update_received = user.test_passages.sort_complited.where(received: nil).where(test_id: user_tests_category)
      update_received.each { |index| index.update_columns(received: true) } # валидация test_passages мешала, пришлось примениить update_columns
     end
  end

  def level_tests_complited?(user, value)
    user_tests_level = user.tests.where(level: value) # все тесты которые проходил пользователь с определенным уровнем
    user.test_passages.sort_complited.where(test_id: user.test_passages.last.test_id).count == 1
    test_level = Test.where(level: user_tests_level)
    complited_test = user.test_passages.sort_complited.where(test_id: user_tests_level).group_by(&:test_id) # все тесты которые он удачно прошел
    if (test_level.count == complited_test.count) && (test_level.count != 0 && complited_test.count != 0)
      update_received = user.test_passages.sort_complited.where(received: nil).where(test_id: user_tests_level)
      update_received.each { |index| index.update_columns(received: true) }
    end
  end

end
