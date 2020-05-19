# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test) # придет конкретный объект и поскольку он один то сработает метод show в контроллере tests_controller, поскольку мы стартуем тест из со страницы всех тестов то что бы отобразился нужный нам объект нужно отправить запрос на метод show в контроллере tests_controller
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
