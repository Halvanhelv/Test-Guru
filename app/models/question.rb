# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :gists
  has_many :answers
  validates :body, presence: true
end
