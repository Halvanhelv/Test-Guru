# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found # не забывать ":" перед названием метода

  def index
    @questions = @test.questions.all
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    if @question.destroy
      redirect_to test_questions_path(@question.test)
    else
      render 'edit'

    end
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path(@test) # при передаче объекта все равно подставляется цифра
    else
      render :new # вызов вьюшки new но без кода внутри. @question берется отсюда
    end
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: '<h1>Вопрос не найден</h1>'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
