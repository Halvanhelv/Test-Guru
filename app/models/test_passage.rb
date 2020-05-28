# frozen_string_literal: true

class TestPassage < ApplicationRecord
  scope :filter_complited, -> { where(complited: true) }
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: :create # после инициализация объекта класса TestPassage в памяти и после проверки на валидность будет вызов указанного метода
  before_validation :before_validation_set_next_question, on: :update
  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.complited = 1 if success?
    save!
  end
  WIN_COUNT = 85
  def questions_count
    test.questions.count
  end

  def success?
    result? > WIN_COUNT
  end

  def progress_bar
    all_questions_number == 1 ? 0 : ((all_questions_number - 1) * 100) / questions_count
  end

  def all_questions_number
    test.questions.to_a.index(current_question) + 1
  end

  def result?
    test_all_questions_count = test.questions.count
    correct_questions_count = correct_questions
    (Float(correct_questions_count * 100) / test_all_questions_count).ceil
  end

  def correct_answer?(answer_ids)
    return if answer_ids.nil? # если юзер не сделает выбор

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def complited?
    current_question.nil?
  end
  def check_timer
    (created_at.to_i + self.test.timer * 60) > Time.now.to_i
  end

  def timer_end
    (created_at.to_i + self.test.timer * 60) - Time.now.to_i
  end
  private

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first if test.present?
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
