class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers

  def has_correct_answer_before?
    answers = self.answers
    answers.each do |answer|
      if answer.correct
        return true
      end
    end
    return false
  end

end
