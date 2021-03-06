Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "confirmations/registrations" }

  devise_scope :user do
    get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  end
  # get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  resources :teacher_subjects do
    resources :lessons, only: [:create] do
    end
  end

  resources :lessons, only: [] do
    member do
      put :change_status
    end
    resources :reviews, only: [:create, :new]
  end

  root to: 'pages#home'

  resources :profiles, only: [:show ]
  get 'help', to: 'pages#help'
  get 'about', to: 'pages#about'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'errors', to: 'pages#errors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
