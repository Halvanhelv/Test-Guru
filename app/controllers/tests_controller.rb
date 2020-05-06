class TestsController < ApplicationController
  before_action :find_test, only: %i[edit show update]
  before_action :find_question, only: %i[show destroy edit]
  def index
    @tests = Test.all
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_questions_path(@test) # при передаче объекта все равно подставляется цифра
    else
      render :new # вызов вьюшки new но без кода внутри. @question берется отсюда
    end
  end

  def new
    @test = Test.new
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

  def find_question
    @question = Question.find(params[:id])
  end
end
