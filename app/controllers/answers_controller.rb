class AnswersController < ApplicationController
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
      flash[:success] = "Ответ успешно создан!"
      redirect_to test_question_path(@test, @question)
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Ответ успешно отредактирован!"
      redirect_to test_question_path(@test, @question)
    else
      render 'edit'
    end
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
