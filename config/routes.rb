Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    resources :questions do
      resources :answers
    end
  end
  resources :test_results
end
