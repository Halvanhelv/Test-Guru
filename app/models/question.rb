class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validate :body, presence: true
end
