# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  def index
    @tests = Test.all
  end

  def start
    if @test.questions.any?

      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash['warning'] = 'Администратор еще не добавил вопросов '
      redirect_to root_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
