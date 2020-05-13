# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[edit show update start]

  before_action :set_user, only: :start
  def index
    @tests = Test.all
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_questions_path(@test) # при передаче объекта все равно подставляется цифра
    else
      render :new # вызов вьюшки new но без кода внутри. @test берется отсюда
    end
  end

  def new
    @test = Test.new
  end

  def start
    current_user.tests.push(@test)

    redirect_to @user.test_passage(@test) # придет конкретный объект и поскольку он один то сработает метод show в контроллере tests_controller, поскольку мы стартуем тест из со страницы всех тестов то что бы отобразился нужный нам объект нужно отправить запрос на метод show в контроллере tests_controller
  end

  def show; end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render 'edit'
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end


end
