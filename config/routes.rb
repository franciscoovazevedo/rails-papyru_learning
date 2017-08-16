Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  end
  # get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  resources :teacher_subjects
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
