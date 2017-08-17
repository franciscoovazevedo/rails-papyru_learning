Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  devise_scope :user do
    get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  end
  # get 'became_teacher', to: 'confirmations/registrations#became_teacher'
  resources :teacher_subjects
  root to: 'pages#home'
  get 'help', to: 'pages#help'
  get 'about', to: 'pages#about'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'errors', to: 'pages#errors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
