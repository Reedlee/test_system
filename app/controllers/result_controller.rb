class ResultController < ApplicationController
  def test_form
    @test = Test.find(params[:id])
    @questions = @test.questions

  end
  def create_form

    @answers = test_params
    @a = params[:question]

    render :text => "#{test_params[:report]}".html_safe
  end
  def create_report

  end
  private
  def test_params
    params.require(:result).permit( :test,:st_name, :st_surname, :st_group)
  end

  def report_params

  end

end