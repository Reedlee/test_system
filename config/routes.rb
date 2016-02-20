Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    resources :questions, except:[:index] do
      resources :answers, except:[:index, :show]
    end
  end
end
