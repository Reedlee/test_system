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
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      flash[:notice] = "Курс #{@test.name} успешно обновлен!"
      redirect_to tests_path
    else
      render 'edit'
    end
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
