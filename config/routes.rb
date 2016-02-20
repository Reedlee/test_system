Rails.application.routes.draw do
  get 'answers/index'

  get 'answers/show'

  get 'answers/new'

  get 'answers/create'

  get 'answers/edit'

  get 'answers/update'

  get 'answers/destroy'

  resources 'tests', 'questions'
end
