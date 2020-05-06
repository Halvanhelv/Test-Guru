# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :author_id)
  end





  def question_params
    params.require(:question).permit(:body)
  end


end
