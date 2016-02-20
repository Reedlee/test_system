Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    resources :questions, except:[:index] do
      resources :answers, except:[:index, :show]
    end
  end
  get 'public/:id'=> 'result#test_form', as: :result
  post 'public/:id'=> 'result#create_form', as: :send_result
end
