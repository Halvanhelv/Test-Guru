class Timer < ApplicationRecord
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def check_timer
    (@test_passage.created_at.to_i + @test_passage.test.timer * 60) > Time.now.to_i
  end

  def timer_end
      (@test_passage.created_at.to_i + @test_passage.test.timer * 60) - Time.now.to_i
  end
end
