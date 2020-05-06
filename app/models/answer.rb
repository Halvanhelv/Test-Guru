# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  scope :corrects, -> { where(correct: true) }
  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:question) if question.answers.count >= 4
  end
end
