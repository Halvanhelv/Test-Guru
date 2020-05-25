class BadgeService
  def checked(current_user)
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_complited?", current_user, badge.value
        current_user.badges << badge
      end
    end
  end

  def first_try_tests_complited?(user, _value = false)
    if user.test_passages.last.received == true
    user.test_passages.filter_complited.where(test_id: user.test_passages.last.test_id)
    end
  end

  def category_tests_complited?(user, category)
    tests_with_correct_category = Test.sort_category(category) # все тесты  с определенной категорией
    complited_test = user.test_passages.filter_complited.where(received: false ).where(test_id: tests_with_correct_category).group_by(&:test_id) # все тесты которые он удачно прошел
    if tests_with_correct_category.count == complited_test.count
      update_received = user.test_passages.filter_complited.where(received: false).where(test_id: tests_with_correct_category)
      update_received.each { |index| index.update_columns(received: true) } #  мешала, пришлось примениить update_columns

    end
  end

  def level_tests_complited?(user, level)
    tests_with_correct_level = Test.where(level: level) # все тесты c нужным уровнем
    complited_test = user.test_passages.filter_complited.where(test_id: tests_with_correct_level).group_by(&:test_id) # все тесты которые он удачно прошел,делаю групировку если юзер прошел один и тот же тест дважды что бы он не засчитывался в общую копилку, иначе в сравнении тестов которые прошел пользователь будет больше чем вообще тестов впринципе
    if tests_with_correct_level.count == complited_test.count
      update_received = user.test_passages.filter_complited.where(received: false ).where(received: false).where(test_id: tests_with_correct_level)
      update_received.each { |index| index.update_columns(received: true) }

    end
  end
end
