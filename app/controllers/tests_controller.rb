class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:success] = 'Тест успешно создан!'
      redirect_to tests_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Test.destroy(params[:id])
    flash[:notice] = 'Тест успешно удален!'
    redirect_to :back
  end
  private
  def test_params
    params.require(:test).permit( :name, :description)
  end
end
