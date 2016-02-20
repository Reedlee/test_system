class AddDependencesToResults < ActiveRecord::Migration
  def change
    add_reference :results, :test, index: true, foreign_key: true
    add_reference :results, :question, index: true, foreign_key: true
    add_reference :results, :answer, index: true, foreign_key: true
  end
end
