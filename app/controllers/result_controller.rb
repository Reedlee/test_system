class ResultController < ApplicationController
  def test_form
    @test = Test.find(params[:id])
    @questions = @test.questions
    @result = Result.new
  end
  def create_form
    @result = Result.new(result_params)

    @a = params[:question]
    @amount = {}

    @a.each do |question_id, answer_id|
      if Answer.find(answer_id).correct
        @amount[Question.find(question_id).text] = true
      end
    end
    @result.report= @amount
    @result.save
    render :text => "#{test_params[:report]}".html_safe
  end
  def create_report

  end
  private
  def result_params
    params.require(:result).permit( :test,:st_name, :st_surname, :st_group)
  end
end