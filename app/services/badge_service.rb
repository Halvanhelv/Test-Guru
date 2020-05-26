class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_complited?", badge.value
        @test_passage.user.badges << badge
      end
    end
  end

  def first_try_tests_complited?(_value = false)
    TestPassage.where(user_id: @test_passage.user.id).where(complited: true).where(test_id: @test_passage.test.id).count == 1
  end

  def category_tests_complited?(category)
    tests_with_correct_category = Test.sort_category(category) # все тесты  с определенной категорией
    complited_test = @test_passage.user.test_passages.filter_complited.where(received: false ).where(test_id: tests_with_correct_category).group_by(&:test_id) # все тесты которые он удачно прошел
    if tests_with_correct_category.count == complited_test.count
      update_received = @test_passage.user.test_passages.filter_complited.where(received: false).where(test_id: tests_with_correct_category)
      update_received.each { |index| index.update_columns(received: true) } #  мешала, пришлось примениить update_columns
      true
    else
      false
    end
  end

  def level_tests_complited?(level)
    tests_with_correct_level = Test.where(level: level) # все тесты c нужным уровнем
    complited_test = @test_passage.user.test_passages.filter_complited.where(test_id: tests_with_correct_level).group_by(&:test_id) # все тесты которые он удачно прошел,делаю групировку если юзер прошел один и тот же тест дважды что бы он не засчитывался в общую копилку, иначе в сравнении тестов которые прошел пользователь будет больше чем вообще тестов впринципе
    if tests_with_correct_level.count == complited_test.count
      update_received = @test_passage.user.test_passages.filter_complited.where(received: false ).where(received: false).where(test_id: tests_with_correct_level)
      update_received.each { |index| index.update_columns(received: true) }
      true
    else
      false
    end
  end
end
