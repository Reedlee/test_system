class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @question = Question.find(params[:question_id])
    @test = @question.test
    @answer = @question.answers.build
  end

  def create
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:notice] = "Ответ успешно создан!"
      redirect_to test_question_path(@test, @question)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Answer.destroy(params[:id])
    flash[:notice] = 'Ответ успешно удален!'
    redirect_to :back
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :question_id, :correct)
  end
end
