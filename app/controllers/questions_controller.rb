class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found  # не забывать ":" перед названием метода


  def index
    @questions = @test.questions.all

  end

  def destroy
    @question.destroy
  end

  def create

    @question = @test.questions.create(question_params)

    if @question.save
      redirect_to test_questions_path(@test) # при передаче объекта все равно подставляется цифра
    else
      render inline: '<h1"><%= @question.errors.full_messages %></h1>'
    end
  end

  def new; end

  def show
    render inline: "<h1><%= @question.body %></h1> "
    # <%= link_to 'log out', question_path, :method => :delete %>
  end

  private

  def rescue_with_question_not_found
    render inline: '<h1>Вопрос не найден</h1>'

  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

end