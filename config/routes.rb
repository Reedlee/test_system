Rails.application.routes.draw do
  resources :tests, :questions, :answers, :test_results
end
