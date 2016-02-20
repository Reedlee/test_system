class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:notice] = "Вопрос успешно создан!"
      redirect_to test_path(@test)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Question.destroy(params[:id])
    flash[:notice] = 'Вопрос успешно удален!'
    redirect_to :back
  end
  private
  def question_params
    params.require(:question).permit(:text, :test_id)
  end
end
