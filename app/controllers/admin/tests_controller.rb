# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update update_inline destroy]
  def index
    @tests = Test.all
  end

  def edit; end

  # def destroy
  #   @test.destroy
  #   redirect_to admin_tests_path
  # end

  def create
    @test = current_user.tests_author.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success') # при передаче объекта все равно подставляется цифра
    else
      render :new # вызов вьюшки new но без кода внутри. @test берется отсюда
    end
  end

  def new
    @test = Test.new
  end

  def show; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render 'edit'
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end
end
