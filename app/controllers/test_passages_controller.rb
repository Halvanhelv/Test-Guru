# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :authenticate_user!

  def show; end

  def result
    flash[:timer] = 'Время вышло' unless @test_passage.check_timer || @test_passage.test.timer.zero?
  end

  def update
    if @test_passage.check_timer || @test_passage.test.timer.zero?
      @test_passage.accept!(params[:answers_ids])
      if @test_passage.complited?
        BadgeService.new(@test_passage).call if @test_passage.success?

        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      flash[:timer] = 'Время вышло'
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def gist
    connection = GistQuestionService.new(@test_passage.current_question)
    result = connection.call
    if connection.success?
      current_user.gists.create(question_id: @test_passage.current_question_id, link_to_gist: result.html_url)
      flash[:notice] =
        t('.success', gist_link: view_context.link_to('Gist', result.html_url, target: '_blank', rel: 'noopener'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
